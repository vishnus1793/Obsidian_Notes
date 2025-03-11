## title: Pointers Cheat Sheet tags: [C, C++, Pointers]

# 📌 Pointers Cheat Sheet

## 🔹 Basics of Pointers

- A **pointer** is a variable that stores the memory address of another variable.
- **Declaration:**
    
    ```c
    int *ptr;  // Pointer to an integer
    char *cptr;  // Pointer to a character
    ```
    
- **Initialization:**
    
    ```c
    int a = 10;
    int *ptr = &a;  // Storing address of 'a' in pointer 'ptr'
    ```
    
- **Dereferencing (Accessing Value):**
    
    ```c
    printf("%d", *ptr);  // Outputs 10
    ```
    

## 🔹 Types of Pointers

| Type                    | Description                                                                 |
| ----------------------- | --------------------------------------------------------------------------- |
| **Null Pointer**        | A pointer that does not point to any valid memory address (`NULL`).         |
| **Void Pointer**        | A generic pointer that can hold the address of any data type (`void *ptr`). |
| **Wild Pointer**        | An uninitialized pointer that points to a random memory location.           |
| **Dangling Pointer**    | A pointer that references a memory location that has been freed or deleted. |
| **Constant Pointer**    | A pointer that cannot change the address it holds (`int *const ptr`).       |
| **Pointer to Constant** | A pointer that cannot modify the value it points to (`const int *ptr`).     |
| **Function Pointer**    | A pointer that stores the address of a function.                            |
| **Array of Pointers**   | An array where each element is a pointer to a variable.                     |
| **Pointer to Pointer**  | A pointer that stores the address of another pointer (`int **ptr`).         |

## 🔹 Pointer Operations

|Operation|Example|
|---|---|
|**Assign Address**|`ptr = &a;`|
|**Dereference**|`*ptr = 20;`|
|**Pointer Arithmetic**|`ptr++; ptr--; ptr + 2;`|
|**Pointer to Array**|`int arr[5]; int *ptr = arr;`|
|**Pointer to Function**|`int (*fptr)(int, int);`|
|**Pointer to Structure**|`struct Example *ptr;`|

## 🔹 Function Pointers Example

```c
#include <stdio.h>
void hello() {
    printf("Hello, World!");
}
int main() {
    void (*funcPtr)();  // Function pointer declaration
    funcPtr = hello;  // Assign function address
    funcPtr();  // Call function using pointer
    return 0;
}
```

## 🔹 Pointer to Pointer Example

```c
#include <stdio.h>
int main() {
    int a = 10;
    int *p = &a;
    int **pp = &p;  // Pointer to pointer

    printf("Value of a: %d\n", **pp);
    return 0;
}
```

🚀 _Mastering pointers is essential for efficient memory management in C/C++!_



---

## title: Types of Pointers with Examples tags: [C, C++, Pointers]

# 🔹 Types of Pointers with Examples

## 1️⃣ **Null Pointer**

A pointer that does not point to any valid memory location.

```c
#include <stdio.h>
int main() {
    int *ptr = NULL; // Null pointer
    printf("Pointer value: %p\n", ptr);
    return 0;
}
```

## 2️⃣ **Void Pointer (Generic Pointer)**

A pointer that can hold the address of any data type.

```c
#include <stdio.h>
int main() {
    int a = 10;
    void *ptr = &a; // Void pointer
    printf("Value: %d\n", *(int*)ptr);
    return 0;
}
```

## 3️⃣ **Wild Pointer**

An uninitialized pointer pointing to a random memory location.

```c
#include <stdio.h>
int main() {
    int *ptr; // Wild pointer
    printf("Value: %p\n", ptr); // Unpredictable result
    return 0;
}
```

## 4️⃣ **Dangling Pointer**

A pointer that references memory that has been freed.

```c
#include <stdio.h>
#include <stdlib.h>
int main() {
    int *ptr = (int*)malloc(sizeof(int));
    *ptr = 20;
    free(ptr); // Memory freed
    // ptr is now a dangling pointer
    return 0;
}
```

## 5️⃣ **Constant Pointer**

A pointer that cannot change the address it holds.

```c
#include <stdio.h>
int main() {
    int a = 10, b = 20;
    int *const ptr = &a; // Constant pointer
    *ptr = 15; // Allowed
    // ptr = &b; // Error: Address modification not allowed
    return 0;
}
```

## 6️⃣ **Pointer to Constant**

A pointer that cannot modify the value it points to.

```c
#include <stdio.h>
int main() {
    int a = 10;
    const int *ptr = &a; // Pointer to constant
    // *ptr = 15; // Error: Value modification not allowed
    return 0;
}
```

## 7️⃣ **Function Pointer**

A pointer storing the address of a function.

```c
#include <stdio.h>
void hello() {
    printf("Hello, World!\n");
}
int main() {
    void (*funcPtr)() = hello; // Function pointer
    funcPtr(); // Function call via pointer
    return 0;
}
```

## 8️⃣ **Array of Pointers**

An array where each element is a pointer.

```c
#include <stdio.h>
int main() {
    int a = 10, b = 20;
    int *arr[2] = {&a, &b}; // Array of pointers
    printf("%d %d\n", *arr[0], *arr[1]);
    return 0;
}
```

## 9️⃣ **Pointer to Pointer**

A pointer storing the address of another pointer.

```c
#include <stdio.h>
int main() {
    int a = 10;
    int *p = &a;
    int **pp = &p; // Pointer to pointer
    printf("Value of a: %d\n", **pp);
    return 0;
}
```

🚀 _Understanding different pointer types is crucial for efficient memory management in C/C++!_

