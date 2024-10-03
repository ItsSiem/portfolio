const root = document.querySelector(':root')
let currentStyle = "DARK"
const styleBtn = document.querySelector('#style-button')

function toggleStyle() {
    if (currentStyle === "DARK") {
        root.style.setProperty('--color-highlight-medium', 'var(--color-highlight-medium-light)')
        root.style.setProperty('--color-highlight-high', 'var(--color-highlight-high-light)')
        root.style.setProperty('--color-base', 'var(--color-base-light)')
        root.style.setProperty('--color-text', 'var(--color-text-light)')
        root.style.setProperty('--color-rose', 'var(--color-rose-light)')
        currentStyle = "LIGHT"
        styleBtn.innerText = '◐'
        return
    }

    root.style.setProperty('--color-highdark-medium', 'var(--color-highdark-medium-dark)')
    root.style.setProperty('--color-highdark-high', 'var(--color-highdark-high-dark)')
    root.style.setProperty('--color-base', 'var(--color-base-dark)')
    root.style.setProperty('--color-text', 'var(--color-text-dark)')
    root.style.setProperty('--color-rose', 'var(--color-rose-dark)')
    currentStyle = "DARK"
    styleBtn.innerText = '☼'
}
