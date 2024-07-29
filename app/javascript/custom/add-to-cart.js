export default function () {
  const productContainers = document.querySelectorAll('.pizzeria-menu__item')

  productContainers.forEach(container => {
    const decreaseButton = container.querySelector('.decrease')
    const increaseButton = container.querySelector('.increase')
    const countDisplay = container.querySelector('.count')
    const quantityInput = container.querySelector('.cart-item-quantity')

    decreaseButton.addEventListener('click', () => {
      let count = parseInt(countDisplay.innerText)
      if (count > 0) {
        count--
        countDisplay.innerText = count
        quantityInput.value = count
      }
    })

    increaseButton.addEventListener('click', () => {
      let count = parseInt(countDisplay.innerText)
      count++
      countDisplay.innerText = count
      quantityInput.value = count
    })
  })
}
