'use strict';

/*
Initialize battle game
 */
document.addEventListener('DOMContentLoaded', () => {
    // listen howto button
    document.querySelector('.howto-button').addEventListener('click', onClickHowto);
    // init the battle
    let battle = new Battle();
    // run battle
    battle.run();
});

/*
HOWTO BUTTON
 */
function onClickHowto() {
    document.querySelector('.howto-content').classList.toggle('hide');
}

/*
prevent double-touch zoom in ios safari
 */
window.onload = () => {
    document.addEventListener('touchstart', (event) => {
        if (event.touches.length > 1) {
            event.preventDefault();
        }
    }, { passive: false });

    let lastTouchEnd = 0;
    document.addEventListener('touchend', (event) => {
        const now = (new Date()).getTime();
        if (now - lastTouchEnd <= 300) {
            event.preventDefault();
        }
        lastTouchEnd = now;
    }, false);
};
