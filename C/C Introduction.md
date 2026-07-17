C was introduced to world by the guy called Dennis Ritchie in the year 1972
At that People were Used Dennis Ritchie's Compiler (DMR) to compile the Code 
DMR created for the PDP-11 minicomputer

**The Mid-1970s / 1980s:** Unix spreads, and compilers like **PCC** (Portable C Compiler) and commercial tools like **Turbo C** pick up the slack.

After Richard Stallman GNU came out 
gcc got out in the year of 1987 
GCC = GNU Compiler Collection 

```
gcc main.c
(or)
gcc main.c -o main
(or)
gcc -Wall main.c -o main #with warnings safety
```

## How the C does it works 


### 1. Preprocessing (`.c` $\rightarrow$ `.i`)

- **Tool:** `cpp` (C Preprocessor)
    
- **What it does:** As you mentioned, it handles file inclusion, macro expansion, and comment stripping.
    
- **Command:** `gcc -E main.c -o main.i`

### 2. Compilation (`.i` $\rightarrow$ `.s`)

- **Tool:** `cc1` (The actual C compiler frontend/backend)
    
- **What it does:** It takes the pure, expanded C code (`.i`), performs **syntax and semantic checking** (throwing errors if you missed a semicolon or mismatched types), and optimizes the code structure. It then translates the C code into architecture-specific **assembly language** (e.g., x86_64 or ARM instructions).
    
- **Command:** `gcc -S main.i -o main.s`
    

### 3. Assembly (`.s` $\rightarrow$ `.o`)

- **Tool:** `as` (The Assembler)
    
- **What it does:** It translates the human-readable assembly instructions (`mov`, `push`, `jmp`) into **machine code** (binary `0`s and `1`s). The resulting `.o` file is called an _object file_. It contains raw binary instructions, but it isn't fully executable yet because external function calls (like `printf`) haven't been linked to their actual memory locations.
    
- **Command:** `gcc -c main.s -o main.o`
    

### The Final Missing Step: Linking (`.o` $\rightarrow$ Executable)

To complete the picture, there is one last stage right after the assembler:

- **Tool:** `ld` (The Linker)
    
- **What it does:** It takes your `.o` file, combines it with any other object files in your project, and links it against standard system libraries (like `libc`). It resolves all the memory addresses so the operating system knows exactly where to jump when a function is called.
    
- **Command:** `gcc main.o -o main` (Outputs the final runnable binary).