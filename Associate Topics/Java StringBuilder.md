```
public class Main {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder("Hello");
        sb.append(" World");
        sb.insert(5, ",");
        sb.replace(0, 5, "Hi");
        sb.delete(2, 3);
        sb.reverse();
        
        System.out.println(sb);  // Output: "dlroW,iH"
    }
}

```

