![[Pasted image 20260605123426.png]]

Full from of href = Hypertext Reference 

Href Creates a pointer 
src downloads the source and replaces it 

iframe used to embed another html file into current webpage

## What is Event Delegation in JavaScript?

Event delegation is an efficient way to manage events for multiple elements by attaching a single event listener to their common parent.

### How it works

1. **Attach a listener**: Add an event listener to a parent element instead of each child.
2. **Event bubbling**: Events triggered on children bubble up to the parent.
3. **Identify target**: Use `event.target` to determine the clicked element.
4. **Perform action**: Execute logic based on the event target.

// HTML:

// <ul id="item-list">

//   <li>Item 1</li>

//   <li>Item 2</li>

// </ul>

const itemList = document.getElementById('item-list');

itemList.addEventListener('click', (event) => {

  if (event.target.tagName === 'LI') {

    console.log(`Clicked on ${event.target.textContent}`);

  }

});

### Benefits

1. **Efficiency**: Reduces the number of event listeners, improving performance.
2. **Dynamic content**: Automatically handles new elements added to the DOM.

---

## Function declarations vs. Function expressions

### Function declarations:

- **Syntax**: `function foo() {}`
- **Hoisting**: Fully hoisted; can be called before its definition.

foo(); // "Hello!"

function foo() {

  console.log('Hello!');

}

### Function expressions:

- **Syntax**: `var foo = function() {}`
- **Hoisting**: Only the variable is hoisted, not the function body.

foo(); // TypeError: foo is not a function

var foo = function () {

  console.log('Hello!');

};

