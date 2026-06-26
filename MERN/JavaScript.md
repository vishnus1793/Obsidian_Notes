## How do `<script>`, `<script async>`, and `<script defer>` differ?

### `<script>`

When using the `<script>` tag without attributes, it fetches and executes the script immediately, pausing HTML parsing.

**Use case**: Critical scripts needed before page rendering.

<script src="main.js"></script>

### `<script async>`

With `async`, the script loads in parallel to HTML parsing and executes as soon as it's ready.

**Use case**: Independent scripts like analytics or ads.

<script async src="analytics.js"></script>

### `<script defer>`

When using `defer`, the script loads alongside HTML parsing but only executes after the HTML is fully parsed.

**Use Case**: Scripts that rely on a complete DOM structure.

<script defer src="deferred.js"></script>

---
## How does prototypal inheritance work?

Prototypal inheritance is a way for objects to share properties and methods through their prototype chain.

### Key concepts:

1. **Prototypes**: Each object has a prototype, from which it inherits properties and methods.
2. **Prototype chain**: JavaScript looks for properties/methods up the chain until it finds them or reaches `null`.
3. **Constructor functions**: Functions used with `new` to create objects.

function Animal(name) {

  this.name = name;

}

Animal.prototype.sayName = function () {

  console.log(`My name is ${this.name}`);

};

function Dog(name, breed) {

  Animal.call(this, name);

  this.breed = breed;

}

Dog.prototype = Object.create(Animal.prototype);

Dog.prototype.bark = function () {

  console.log('Woof!');

};

let fido = new Dog('Fido', 'Labrador');

fido.bark(); // "Woof!"

fido.sayName(); // "My name is Fido"

---
## What is a higher-order function?

A higher-order function is a function that either:

1. **Accepts another function as an argument**:
    
    function greet(name) {
    
      return `Hello, ${name}!`;
    
    }
    
    function greetUser(greeter, name) {
    
      console.log(greeter(name));
    
    }
    
    greetUser(greet, 'Alice'); // Hello, Alice!
---
## What is event bubbling?

Event bubbling is the process where an event triggers on the target element and then propagates upwards through its ancestors in the DOM.

const parent = document.getElementById('parent');

const child = document.getElementById('child');

parent.addEventListener('click', () => {

  console.log('Parent clicked');

});

child.addEventListener('click', () => {

  console.log('Child clicked');

});

Clicking the child element will log both "Child clicked" and "Parent clicked" due to bubbling.

### Prevent bubbling:

Use `event.stopPropagation()` to prevent the event from propagating upwards.

child.addEventListener('click', (event) => {

  event.stopPropagation();

  console.log('Child clicked only');

});

---
