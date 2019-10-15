'use strict';

/*
mobile menu only
 */

let mobileNav = document.querySelector('.mobile-nav');
let mobileNavIcon = document.querySelector('.mobile-nav .fas');
let mobileMenu = document.querySelector('.mobile-menu');
let arrowTop = document.querySelector('.mobile-arrow');

mobileNav.addEventListener('click', () => {
    mobileNavIcon.classList.toggle('fa-bars');
    mobileNavIcon.classList.toggle('fa-times');
    mobileNavIcon.classList.toggle('mobile-menu-in');
    mobileMenu.classList.toggle('hide');
    mobileMenu.classList.toggle('mobile-menu-in');
});

arrowTop.addEventListener('click', () => {
    window.scroll({
        top: 0,
        left: 0,
        behavior: 'smooth'
    });
});
