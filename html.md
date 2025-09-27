# HTML & CSS Cheat Sheet — Quick Reference

A compact, beginner-friendly cheat sheet for quick lookup. Includes essential HTML tags with examples, commonly used CSS selectors & properties, concise code snippets, best practices, and modern web development notes.

---

## Table of Contents

1. HTML Essentials
2. Common HTML Elements & Examples
3. Accessibility & Meta
4. Forms & Input Types
5. CSS Selectors (common)
6. Core CSS Properties
7. Layout: Flexbox & Grid
8. Responsive Design & Media Queries
9. CSS Snippets (useful patterns)
10. Best Practices
11. Modern Notes & Tools

---

## 1 — HTML Essentials

Basic document structure:

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Page title</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- content -->
</body>
</html>
```

Key points:

* `<!doctype html>` enables standards mode.
* `lang` helps accessibility & SEO.
* `meta viewport` is essential for mobile responsiveness.

---

## 2 — Common HTML Elements & Usage Examples

### Headings & Text

```html
<h1>Main heading</h1>
<h2>Subheading</h2>
<p>This is a paragraph. <strong>strong</strong>, <em>emphasis</em>, <small>small</small></p>
```

### Links & Images

```html
<a href="https://example.com" target="_blank" rel="noopener noreferrer">Visit</a>
<img src="photo.jpg" alt="Descriptive text" width="600">
```

* Use descriptive `alt` text for images.
* Add `rel="noopener noreferrer"` when using `target="_blank"`.

### Lists

```html
<ul>
  <li>Item</li>
</ul>
<ol>
  <li>First</li>
</ol>
```

### Semantic Structure

```html
<header>Site header</header>
<nav>Navigation links</nav>
<main>Main content</main>
<aside>Sidebar</aside>
<footer>Footer</footer>
```

* Prefer semantic elements (`article`, `section`, `nav`, `aside`) for clarity & accessibility.

### Media

```html
<video controls src="video.mp4">Your browser does not support video.</video>
<audio controls src="sound.mp3"></audio>
```

### Tables (simple)

```html
<table>
  <thead><tr><th>Name</th><th>Age</th></tr></thead>
  <tbody><tr><td>Alice</td><td>30</td></tr></tbody>
</table>
```

---

## 3 — Accessibility & Meta

* Use `aria-*` only when native HTML cannot express semantics.
* `label` elements: tie to inputs via `for` or wrap input inside label.

```html
<label for="email">Email</label>
<input id="email" type="email" />
```

* Screen-reader-friendly hidden text:

```css
.sr-only { position:absolute; width:1px; height:1px; padding:0; overflow:hidden; clip:rect(0,0,0,0); white-space:nowrap; border:0; }
```

* Important meta tags:

```html
<meta name="description" content="Short page description">
<meta name="theme-color" content="#0a0a0a">
```

---

## 4 — Forms & Input Types

* Common types: `text`, `email`, `password`, `number`, `tel`, `url`, `date`, `datetime-local`, `file`, `checkbox`, `radio`, `range`, `search`.
* Example:

```html
<form action="/submit" method="post">
  <label>Email: <input type="email" name="email" required></label>
  <button type="submit">Send</button>
</form>
```

* Use `required`, `min`, `max`, `pattern`, `autocomplete` appropriately.
* Use `novalidate` on `<form>` only when you fully manage validation with JS.

---

## 5 — CSS Selectors (commonly used)

* Type selector: `div {}`
* Class selector: `.btn {}`
* ID selector: `#header {}` (avoid for styling, use for unique elements)
* Descendant: `.nav a {}`
* Child: `ul > li {}`
* Adjacent sibling: `h1 + p {}`
* General sibling: `h1 ~ p {}`
* Attribute: `input[type="text"] {}`
* Pseudo-classes: `:hover`, `:focus`, `:active`, `:nth-child(n)`, `:first-child`.
* Pseudo-elements: `::before`, `::after`, `::placeholder`.
* Grouping: `h1, h2, h3 {}`

Specificity note (simple): inline styles > IDs > classes/attributes/pseudo-classes > elements/pseudo-elements.

---

## 6 — Core CSS Properties (cheat list)

### Box model & fundamentals

* `display` — `block`, `inline`, `inline-block`, `flex`, `grid`, `none`
* `width`, `height`, `max-width`, `min-width`
* `padding`, `margin`, `border`, `box-sizing` (`border-box` recommended)

### Positioning

* `position`: `static`, `relative`, `absolute`, `fixed`, `sticky`
* `top`, `right`, `bottom`, `left`, `z-index`

### Typography

* `font-family`, `font-size`, `font-weight`, `line-height`, `letter-spacing`, `text-align`
* `text-decoration`, `text-transform`, `white-space`, `word-break`

### Colors & Backgrounds

* `color`, `background`, `background-image`, `background-size`, `background-position`
* Use `rgba()` / `hsla()` or CSS variables for theme management.

### Visuals

* `border-radius`, `box-shadow`, `opacity`, `filter`

### Transitions & Animations

* `transition: property duration timing-function delay;`
* `@keyframes` + `animation` for complex sequences.

### Misc

* `overflow` (`visible`, `hidden`, `auto`, `scroll`)
* `cursor`, `visibility` (`hidden` vs `display:none`)

---

## 7 — Layout: Flexbox & Grid (cheat commands)

### Flexbox (one-dimensional)

Parent:

```css
.container { display: flex; flex-direction: row; flex-wrap: nowrap; justify-content: flex-start; align-items: stretch; }
```

Child:

```css
.item { flex: 1 1 auto; /* grow shrink basis */ }
```

Useful shortcuts:

* `justify-content: center | space-between | space-around | space-evenly`
* `align-items: center | flex-start | stretch`

### Grid (two-dimensional)

Parent:

```css
.grid { display: grid; grid-template-columns: 1fr 2fr; gap: 16px; }
```

Span items:

```css
.item { grid-column: 1 / span 2; }
```

Auto layout patterns:

* `grid-template-columns: repeat(auto-fit, minmax(200px, 1fr))` for responsive columns.

---

## 8 — Responsive Design & Media Queries

Mobile-first approach (recommended):

```css
/* base (mobile) */
.container { padding: 1rem; }

/* larger screens */
@media (min-width: 768px) {
  .container { padding: 2rem; }
}
```

Useful media features:

* `min-width`, `max-width` — layout breakpoints
* `prefers-reduced-motion` — accessibility for animation
* `prefers-color-scheme: dark` — dark mode

Container queries (modern browsers):

```css
@container (min-width: 400px) {
  .card { padding: 2rem; }
}
```

---

## 9 — CSS Snippets (concise)

### Reset / Normalize (minimal)

```css
* { box-sizing: border-box; }
html, body { margin: 0; padding: 0; }
```

### Center horizontally & vertically (Flex)

```css
.center { display:flex; justify-content:center; align-items:center; }
```

### Responsive image

```css
img { max-width:100%; height:auto; display:block; }
```

### Truncate single-line text

```css
.truncate { white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
```

### CSS variables (theming)

```css
:root { --brand: #0b5cff; --gap: 16px; }
.btn { background: var(--brand); padding: var(--gap); }
```

### Smooth transitions

```css
.btn { transition: transform 180ms ease, box-shadow 180ms ease; }
.btn:hover { transform: translateY(-2px); }
```

---

## 10 — Best Practices (concise)

* Use semantic HTML for structure and accessibility.
* Keep CSS modular: use component classes or BEM naming (e.g., `.card__title`).
* Prefer `rem`/`em` for scalable typography; `px` is fine for precise controls.
* Use `box-sizing: border-box` globally.
* Avoid deep selector chains — keep specificity low.
* Prefer `class` selectors for styling; avoid styling by `id`.
* Mobile-first CSS & progressive enhancement.
* Optimize assets: compress images, use modern formats (WebP/AVIF), lazy-load offscreen images (`loading="lazy"`).
* Use `rel="preload"` for critical fonts or resources where appropriate.
* Keep CSS in external files (cacheable) and minimize inline CSS.

---

## 11 — Modern Web Development Notes

* **Accessibility (a11y):** Use semantic HTML, `aria` only when needed, ensure keyboard navigation, label forms, provide alt text.
* **Performance:** minimize render-blocking CSS, use critical CSS patterns, compress assets, HTTP/2 or HTTP/3 helps multiplexing.
* **Progressive Web App (PWA):** service workers, manifest, offline strategies.
* **Modern CSS features:** CSS variables, logical properties (`margin-inline-start`), container queries, subgrid (partial support), `:is()` and `:where()` for lower specificity selectors.
* **Dark mode:** `@media (prefers-color-scheme: dark)` or CSS variables switching.
* **Security:** avoid inline event handlers (`onclick`), sanitize user input, use CSP headers.
* **Tooling:** Preprocessors (Sass) optional; PostCSS, Autoprefixer for compatibility, CSS minifiers, bundlers (Vite, webpack), and TypeScript for JS.
* **Testing & linting:** Use `axe`, `Lighthouse` for audits; `stylelint` and `eslint` for code quality.

---

### Quick Reference — Useful Commands

* Run a local dev server: `npx serve` or `npx http-server` (or use frameworks' dev servers).
* Format HTML/CSS: Prettier.
* Check accessibility: Lighthouse, axe devtools.

---

## Where to Learn More (short list)

* MDN Web Docs (HTML / CSS reference)
* CSS-Tricks (guides and patterns)
* WebAIM (accessibility)
* Google Developers Web (performance & PWA)

---

*Saved: compact HTML & CSS quick reference for fast lookup.*
