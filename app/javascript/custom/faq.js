const accordion = document.querySelectorAll(".faq__accordion-item");
accordion.forEach((item) => {
  item.querySelector(".faq__accordion-outer").addEventListener("click", () => {
    const inner = item.querySelector(".faq__accordion-inner");

    if (item.classList.contains("active")) {
      item.classList.remove("active");
      inner.style.maxHeight = '0';
    } else {
      const itemsActive = document.querySelectorAll(".faq__accordion-item.active");
      itemsActive.forEach((activeItem) => {
        const activeInner = activeItem.querySelector(".faq__accordion-inner");
        activeItem.classList.remove("active");
        activeInner.style.maxHeight = '0';
      });
      item.classList.add("active");
      inner.style.maxHeight = inner.scrollHeight + 'px';
    }
  });
});