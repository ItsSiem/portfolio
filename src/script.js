const root = document.querySelector(':root')
const styleBtn = document.querySelector('#style-button')

if (localStorage.getItem("style") == null) {
    localStorage.setItem("style", "DARK")
}

setStyle(localStorage.getItem("style"))

function toggleStyle() {
    let style = localStorage.getItem("style") == "DARK" ? "LIGHT" : "DARK"
    setStyle(style)
}

function setStyle(style) {
    localStorage.setItem("style", style)
    if (style == "LIGHT") {
        root.style.setProperty('--color-highlight-medium', 'var(--color-highlight-medium-light)')
        root.style.setProperty('--color-highlight-high', 'var(--color-highlight-high-light)')
        root.style.setProperty('--color-base', 'var(--color-base-light)')
        root.style.setProperty('--color-text', 'var(--color-text-light)')
        root.style.setProperty('--color-rose', 'var(--color-rose-light)')
        styleBtn.innerText = '◐'
        return
    }

    root.style.setProperty('--color-highlight-medium', 'var(--color-highlight-medium-dark)')
    root.style.setProperty('--color-highlight-high', 'var(--color-highlight-high-dark)')
    root.style.setProperty('--color-base', 'var(--color-base-dark)')
    root.style.setProperty('--color-text', 'var(--color-text-dark)')
    root.style.setProperty('--color-rose', 'var(--color-rose-dark)')
    styleBtn.innerText = '☼'
}
