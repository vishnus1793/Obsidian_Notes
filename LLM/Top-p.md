## Top-P (Nucleus Sampling)

- **Definition:** A decoding rule that instructs the LLM to sample only from the smallest set of next tokens whose cumulative probability mass reaches a threshold, $p$.
    
- **Example ($\text{top-p} = 0.9$):** The model sorts tokens by probability and dynamically aggregates the most likely options until their combined probability hits 90%. It then samples exclusively from that shortlist.
    
- **Nature:** **Dynamic.** The number of words in the shortlist expands or shrinks depending on how confident the model is.
    

## 2. Top-K vs. Top-P

- **Top-K (Fixed):** Hard-limits the selection pool to a strict, pre-determined number ($K$) of top tokens, regardless of their actual probabilities.
    
- **Top-P (Dynamic):** Changes the pool size based on the confidence of the context, scaling up for open-ended sentences and scaling down for highly predictable phrases.
    

## 3. The Role of Temperature & Why We Need Top-P

- **The Problem with Temperature Alone:**
    
    - While raising the temperature helps prevent **repetitive loops** (greedy decoding), it does so by **flattening the probability distribution**.
        
    - This flattening gives a higher chance to the "long tail" of low-probability words, which often introduces chaotic, nonsensical text.
        
- **The Solution:** **Top-P acts as a dynamic safety net.** By applying Top-P after temperature flattens the distribution, the model can remain creative while instantly cutting off the chaotic, irrelevant noise.