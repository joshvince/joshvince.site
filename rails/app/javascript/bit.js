window.hasSeenDawn = false;
window.prevScrollPosition = window.scrollY;

document.addEventListener("DOMContentLoaded", function() {
  handleAuroraTransitions();
  handleDawnTransitions();
  animateClocks();
});

window.addEventListener("scrollend", function() {
  handleMenuDisplay();
})

function handleAuroraTransitions() {
  let nightSkyParts = document.querySelectorAll(".night-sky div");
  let auroraContainer = document.querySelector(".aurora");

  let observer = new IntersectionObserver(function(entries) {
      entries.forEach(entry => {
          if (entry.isIntersecting) {
            auroraContainer.style.opacity = 1;
            auroraContainer.classList.add('animate-aurora')
            nightSkyParts.forEach(part => { part.style.opacity = 0; })
          }
          else {
            auroraContainer.style.opacity = 0;
            setTimeout(() => {
              auroraContainer.classList.remove('animate-aurora')
            }, 2000);
            nightSkyParts.forEach(part => { part.style.opacity = 1; })
          }

      });
  }, { threshold: 0.1 }); // 1.0 means fully in the viewport

  observer.observe(auroraContainer);
}

function handleDawnTransitions() {
  let auroraContainer = document.querySelector(".aurora");
  let dawnSkyContainer = document.querySelector(".dawn-sky");
  let dawnSkyParts = document.querySelectorAll(".dawn-sky div");

  let observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
          auroraContainer.style.opacity = 0;
          dawnSkyContainer.style.background = `linear-gradient(180deg, var(--midnight), var(--dawn))`;
          dawnSkyParts.forEach(part => {
            part.style.opacity = 1;
          })
          window.hasSeenDawn = true;
        }
        else {
          auroraContainer.style.opacity = 1;
          dawnSkyParts.forEach(part => { part.style.opacity = 0; })
        }

    });
  }, { threshold: 0.3 }); // 1.0 means fully in the viewport

  observer.observe(dawnSkyContainer);
}

function animateClocks() {
  const clocks = document.querySelectorAll('.clock')

  clocks.forEach(clock => {
    let observer = new IntersectionObserver(function(entries) {
      entries.forEach(entry => {
          if (entry.isIntersecting) {
            clock.querySelector('.minute-hand').classList.add('animate-minute')
            clock.querySelector('.hour-hand').classList.add('animate-hour')
          }
          else {
            clock.querySelector('.minute-hand').classList.remove('animate-minute')
            clock.querySelector('.hour-hand').classList.remove('animate-hour')
          }

      });
    }, { threshold: 0.1 }); // 1.0 means fully in the viewport

    observer.observe(clock);
  })
}

function handleMenuDisplay() {
  let currentScrollPos = window.scrollY;
  const menu = document.getElementById('bit-menu');
  let opacity;

  if (window.prevScrollPosition <= currentScrollPos) {
    opacity = 0;
  }
  else {
    opacity = 1;
  }

  window.requestAnimationFrame(() => {
    menu.style.opacity = opacity;
    window.prevScrollPosition = currentScrollPos;
  })
}
