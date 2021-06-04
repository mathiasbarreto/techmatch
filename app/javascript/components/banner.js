import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["develop your app", "design your website","get insights from data", "deliver projects", "solve problems", "make ideas come true"],
    typeSpeed: 95,
    loop: true
  });
}

export { loadDynamicBannerText };