## 1. EMBEDDINGS: The Mathematical Geometry of Meaning

An embedding turns human language into a high-dimensional vector (a list of floating-point numbers) that captures semantic meaning. It maps text into a geometric space where **closeness in distance equals similarity in meaning**.

```
"King"   ───[Embedding Model]───> [ 0.23, -0.45,  0.89, ... 1536 dimensions ]
"Queen"  ───[Embedding Model]───> [ 0.21, -0.41,  0.85, ... 1536 dimensions ]
"Banana" ───[Embedding Model]───> [-0.88,  0.12, -0.34, ... 1536 dimensions ]
```

### The Core Mechanics

- **Dimensionality:** Modern embedding models (like OpenAI's `text-embedding-3-large` or open-source `bge-large-en`) output vectors with 384, 1024, or 3072 dimensions. Each dimension represents an abstract latent semantic feature.
    
- **Distance Metrics:** To find out how similar two pieces of text are, you compute the mathematical distance between their vectors:
    
    - **Cosine Similarity:** Measures the _angle_ between two vectors. Ignores text length. Ranges from -1 to 1. **Most common.**
        
    - **Dot Product:** Fast to compute. If vectors are unit-normalized, Dot Product equals Cosine Similarity.
        
    - **Euclidean Distance (L2​):** Measures the straight-line distance between points. Sensitive to vector magnitude (text length).
        

### Pure Wisdom & Engineering Gotchas

- **Asymmetry Failure:** Standard embedding models are symmetric—they expect the search query and the target document to look similar. If your query is a short question (`"How do I fix a 502 error?"`) and the document is a long log file, similarity scores degrade.
    
    - _Fix:_ Use models trained explicitly for asymmetric retrieval (using prefixes like `query:` and `passage:` like asymmetric BGE/E5 models) or use an LLM to rewrite the query to match the target document style.
        
- **Loss of Word Order:** Traditional bag-of-words models lost context. Transformer-based embeddings capture context (e.g., "Apple stock" vs. "Apple pie" yield completely different vectors because the attention mechanism alters the token representations based on surrounding words).
    

## 2. RAG (Retrieval-Augmented Generation): Non-Volatile Memory

LLMs have a knowledge cutoff and hallucinate. RAG solves this by turning the LLM into an "open-book" exam taker. It fetches relevant documents from an external database and stuffs them into the LLM's prompt context window.

```
[User Query] ──> [Vector DB Search] ──> [Top-K Context Found] 
                                                  │
[Final Answer] <── [LLM Generates] <── [Query + Context Prompt]
```

### The Production Pipeline (Naive RAG)

1. **Ingestion:** Chunk documents (e.g., 500-token blocks) → Embed them → Store vectors in a Vector DB (Pinecone, Milvus, Qdrant, pgvector).
    
2. **Retrieval:** Embed user query → Run Cosine Similarity against Vector DB → Fetch top K chunks.
    
3. **Generation:** Format prompt: `"Answer the query based ONLY on the following context: {context}. Query: {query}"`.
    

### Advanced RAG: The Realities of Production

Naive RAG fails in production. You must use advanced patterns:

- **Parent-Child Chunking:** Embed small sentences (easier for vector match) but pass the larger surrounding paragraph (the parent) to the LLM context so it has full semantic background.
    
- **HyDE (Hypothetical Document Embeddings):** Take the user query → Ask an LLM to write a _fake, hypothetical answer_ → Embed that fake answer → Use _that_ vector to search the DB. Why? A fake answer looks more like the target document than a raw question does.
    
- **Reranking (The Crucial Step):** Vector search is great at finding the top 50 vaguely relevant chunks, but bad at sorting the absolute best to the top. Run your top 50 results through a **Cross-Encoder Reranker** (like Cohere Rerank or BGE-Reranker). It computes deep attention between the query and chunk simultaneously, drastically increasing precision.
    

## 3. FUNCTION CALLING: Giving the LLM Hands

LLMs cannot execute actions; they only output text. Function calling bridges this gap by turning the LLM into a **reasoning engine that outputs structured JSON parameters** instead of conversational text. The developer then executes that JSON in their own code.

```
[User: "What's the weather in BLR?"] ──> [LLM reads available Tools schema]
                                                  │
[App runs actual API & returns output] <── [LLM outputs JSON: { "location": "Bengaluru" }]
```

### The Mechanical Loop

1. **Declaration:** You pass the LLM a list of functions defined in **JSON Schema** format, describing what the function does and what parameters it requires.
    
2. **Evaluation:** The LLM reads the user prompt, realizes it needs external data or actions, stops generating conversational text, and outputs a structured `tool_calls` object containing the function name and arguments.
    
3. **Execution:** Your backend code catches this JSON object, parses it, runs the _actual_ code (e.g., hits a SQL database or weather API), and returns the execution result back to the LLM.
    
4. **Final Response:** The LLM reads the tool's raw output and synthesizes a natural language answer for the user.
    

### Pure Wisdom

- **LLMs do not run your code:** A common misconception is that the LLM executes the code. It doesn't. It merely fills out the form (arguments) required to run the code.
    
- **State Control:** You must handle tool execution states securely. Sanitise the JSON arguments before running raw database queries or shell commands to avoid LLM-driven injection attacks.
    

## 4. STRUCTURED OUTPUTS: Deterministic UI and Data Pipelines

If you need an LLM to extract data from a resume, generate a JSON object for a UI frontend, or output a strict schema, raw text generation is useless. Structured Outputs guarantee that the model's response adheres _exactly_ to a provided JSON Schema or Pydantic model.

### How It Works: Grammar-Based Sampling (The Secret Sauce)

Older methods relied on prompt engineering (_"Output only valid JSON!"_) which failed randomly. Modern APIs (like OpenAI's `response_format: { type: "json_object" }` or strict JSON schema tracking) manipulate the **token probabilities at the decoding level**.

- During generation, the inference engine tracks the state of the JSON schema.
    
- If the schema dictates that a key name must open with a quote (`"`), the engine **forces the probability of all non-quote tokens to 0%** for that step.
    
- The model literally _cannot_ output invalid syntax because the decoding step masks out illegal tokens mathematically.
    

### Architecture Comparison

|Capability|Function Calling|Structured Outputs|
|---|---|---|
|**Primary Intent**|Action execution & tool selection.|Data formatting & schema guarantee.|
|**Output Type**|Direct tool call arguments metadata.|The final response body itself.|
|**State**|Intermediate step in a loop.|Terminal output of a request.|

### Battle-Tested Heuristics for Production

- **Deep Schemas Slow Down Generation:** Extremely deep, deeply nested, or highly recursive JSON schemas increase the overhead of the grammar constraint engine. Keep schemas as flat as possible for low-latency tasks.
    
- **Include an `explanation` field:** If you force an LLM to output pure data structures, its reasoning capabilities drop because it doesn't have "Chain-of-Thought" tokens to think before it answers. **Fix:** Add a `"reasoning"` or `"explanation"` string field at the very top of your JSON schema. Let the model dump its thoughts there first, before it fills out the deterministic data fields.