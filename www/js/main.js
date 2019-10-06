'use strict';



let mobileNav = document.querySelector('.mobile-nav');
let mobileMenu = document.querySelector('.mobile-menu');
let arrowTop = document.querySelector('.mobile-arrow');

mobileNav.addEventListener('click', () => {
    console.log('clicked !');
    mobileMenu.classList.toggle('hide');
});

arrowTop.addEventListener('click', () => {
    window.scroll({
        top: 0,
        left: 0,
        behavior: 'smooth'
    });
});
