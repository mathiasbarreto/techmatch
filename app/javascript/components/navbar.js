const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-techmatch');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-techmatch-white');
      } else {
        navbar.classList.remove('navbar-techmatch-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
