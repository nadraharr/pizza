export default function () {
  const menu = document.querySelector(".header__nav-menu");
  const button = document.querySelector(".header__menu-btn");
  button.addEventListener("click", toggleMobileMenu);
  const links = document.querySelectorAll("li");
  links.forEach((link) => {
    link.addEventListener("click", closeMobileMenu);
  });
  const cart = document.querySelector(".cart-icon");
  cart.addEventListener("click", closeMobileMenu);

  function toggleMobileMenu() {
    menu.classList.toggle("burger-open");
    document.body.classList.toggle("burger-open");
  }

  function closeMobileMenu() {
    menu.classList.remove("burger-open");
    document.body.classList.remove("burger-open");
  }
}