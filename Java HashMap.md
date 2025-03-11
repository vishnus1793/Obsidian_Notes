#  Cheat Sheet

## Importing HashMap
```java
import java.util.HashMap;
```

## Creating a HashMap
```java
HashMap<KeyType, ValueType> map = new HashMap<>();
```

## Adding Elements
```java
map.put(key, value);
```

## Accessing Elements
```java
ValueType value = map.get(key); // Returns null if key not found
```

## Checking If Key Exists
```java
boolean exists = map.containsKey(key);
```

## Checking If Value Exists
```java
boolean exists = map.containsValue(value);
```

## Removing Elements
```java
map.remove(key);
```

## Iterating Through Keys
```java
for (KeyType key : map.keySet()) {
    System.out.println(key);
}
```

## Iterating Through Values
```java
for (ValueType value : map.values()) {
    System.out.println(value);
}
```

## Iterating Through Key-Value Pairs
```java
for (Map.Entry<KeyType, ValueType> entry : map.entrySet()) {
    System.out.println(entry.getKey() + " -> " + entry.getValue());
}
```

## Getting Size
```java
int size = map.size();
```

## Checking If Empty
```java
boolean isEmpty = map.isEmpty();
```

## Clearing the HashMap
```java
map.clear();
```

## Replacing Values
```java
map.replace(key, newValue);
```

## Default Value If Key Not Found
```
ValueType value = map.getOrDefault(key, defaultValue);
```
