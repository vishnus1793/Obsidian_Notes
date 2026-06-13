Spring boot is an autoconfiguring framework designed to simplify the Developement and Deployment 
Spring Boot has the embedded server 
#  Dependency Injection
is a design pattern where a object receive the services or components it needs from a external source rather than creating them itself.

IoC => Inversion of Control

Rest Controller and request mapping 

By type


# Types of Dependency Injection (DI) in Spring Framework

Dependency Injection (DI) is a design pattern used to implement Inversion of Control (IoC). Spring provides dependencies to objects instead of the objects creating them themselves.

## 1. Constructor Injection

Dependencies are provided through the class constructor.

### Example

```java
@Component
public class Engine {
}

@Component
public class Car {

    private final Engine engine;

    @Autowired
    public Car(Engine engine) {
        this.engine = engine;
    }
}
```

### Advantages

- Promotes immutability
- Mandatory dependencies are enforced
- Easier unit testing
- Recommended by Spring

---

## 2. Setter Injection

Dependencies are injected using setter methods.

### Example

```java
@Component
public class Car {

    private Engine engine;

    @Autowired
    public void setEngine(Engine engine) {
        this.engine = engine;
    }
}
```

### Advantages

- Useful for optional dependencies
- Allows dependency modification after object creation

### Disadvantages

- Dependency may be null if not configured properly

---

## 3. Field Injection

Dependencies are injected directly into class fields.

### Example

```java
@Component
public class Car {

    @Autowired
    private Engine engine;
}
```

### Advantages

- Less boilerplate code

### Disadvantages

- Difficult to unit test
- Breaks encapsulation
- Not recommended for production code

---

## Comparison

| Injection Type | Recommended | Immutable | Easy Testing |
|---------------|-------------|------------|-------------|
| Constructor Injection | ✅ Yes | ✅ Yes | ✅ Yes |
| Setter Injection | ✅ Optional Dependencies | ❌ No | ✅ Yes |
| Field Injection | ❌ No | ❌ No | ❌ Difficult |

## Best Practice

Spring recommends **Constructor Injection** because it makes dependencies explicit, supports immutability, and improves testability.