export default function () {
  const carousel = document.querySelector('.special-offers__carousel-inner')
  const buttonPrev = document.querySelector('.carousel-button--prev')
  buttonPrev.addEventListener('click', prevSlide)
  const buttonNext = document.querySelector('.carousel-button--next')
  buttonNext.addEventListener('click', nextSlide)
  const indicatorsContainer = document.querySelector(
    '.special-offers__carousel-indicators-container'
  )
  let currentSlide = 0
  let slideInterval
  let slides = Array.from(carousel.children)
  let slidesPerView = getSlidesPerView()

  renderCarousel()

  function renderCarousel () {
    updateCarousel(currentSlide)
  }

  function prevSlide () {
    currentSlide -= 1
    if (currentSlide < 0) {
      currentSlide = 4
    }
    updateCarousel(currentSlide)
  }

  function nextSlide () {
    currentSlide += 1
    if (currentSlide > slides.length - slidesPerView) {
      currentSlide = 0
    }
    updateCarousel(currentSlide)
  }

  function showButtons () {
    currentSlide > 0
      ? (buttonPrev.style.display = 'block')
      : (buttonPrev.style.display = 'none')
    currentSlide < slides.length - slidesPerView
      ? (buttonNext.style.display = 'block')
      : (buttonNext.style.display = 'none')
  }

  function showIndicators () {
    const newIndicators = []
    for (let i = 0; i < slides.length - slidesPerView + 1; i++) {
      const indicator = document.createElement('button')
      indicator.classList.add('special-offers__carousel-indicator')
      indicator.addEventListener('click', () => indicatorClick(i))
      newIndicators.push(indicator)
    }
    indicatorsContainer.replaceChildren(...newIndicators)
    updateIndicators()
  }

  function updateIndicators () {
    const indicators = indicatorsContainer.children
    for (let i = 0; i < indicators.length; i++) {
      if (i === currentSlide) {
        indicators[i].classList.add('active')
      } else {
        indicators[i].classList.remove('active')
      }
    }
  }

  function indicatorClick (index) {
    currentSlide = index
    updateCarousel(currentSlide)
  }

  function updateCarousel (currentSlide) {
    const carouselPosition = `translateX(-${
      (currentSlide * 100) / slidesPerView
    }%)`
    carousel.style.transform = carouselPosition
    for (let slide of slides) {
      slide.style.flex = `0 0 ${100 / slidesPerView}%`
    }
    showButtons()
    showIndicators()
    resetInterval()
  }

  function resetInterval () {
    clearInterval(slideInterval)
    slideInterval = setInterval(nextSlide, 4000)
  }

  function getSlidesPerView () {
    if (window.innerWidth >= 1024) return 3
    if (window.innerWidth >= 600) return 2
    return 1
  }

  window.addEventListener('resize', () => {
    slidesPerView = getSlidesPerView()
    updateCarousel(currentSlide)
  })
}
