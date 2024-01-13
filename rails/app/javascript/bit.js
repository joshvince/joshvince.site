window.hasSeenDawn = false;
window.prevScrollPosition = window.scrollY;

document.addEventListener("DOMContentLoaded", function() {
  //  Got this from here https://stackoverflow.com/questions/60432805/intersectionobserver-api-erratic-in-safari
  window.setTimeout(() => {
    handleAuroraTransitions();
    handleDawnTransitions();
    animateClocks();
  }, 500)
});

document.addEventListener("scroll", function() {
  window.requestAnimationFrame(() => {
    handleMenuDisplay();
  })
})

function handleAuroraTransitions() {
  let nightSkyParts = document.querySelectorAll(".night-sky .part-container");
  let auroraContainer = document.querySelector(".aurora");

  let observer = new IntersectionObserver(function(entries) {
      entries.forEach(entry => {
          if (entry.isIntersecting) {
            console.log("intersecting")
            showHiddenElement(auroraContainer)
            auroraContainer.style.animationPlayState = 'running';
            nightSkyParts.forEach(part => { hideVisibleElement(part) })
          }
          else {
            console.log("not intersecting")
            hideVisibleElement(auroraContainer)
            auroraContainer.style.animationPlayState = 'paused';
            nightSkyParts.forEach(part => { showHiddenElement(part) })
          }

      });
  }, { threshold: 0.2, root: null }); // 1.0 means fully in the viewport

  observer.observe(auroraContainer);
}

function hideVisibleElement(element) {
  window.requestAnimationFrame(() => {
    element.classList.add('hidden')
  })
}

function showHiddenElement(element) {
  window.requestAnimationFrame(() => {
    element.classList.remove('hidden')
  })
}

function handleDawnTransitions() {
  let auroraContainer = document.querySelector(".aurora");
  let dawnSkyContainer = document.querySelector(".dawn-sky");
  let dawnSkyParts = document.querySelectorAll(".dawn-sky div");

  let observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
          hideVisibleElement(auroraContainer)
          dawnSkyContainer.style.background = `linear-gradient(180deg, var(--midnight), var(--dawn))`;
          dawnSkyParts.forEach(part => showHiddenElement(part))
          window.hasSeenDawn = true;
        }
        else {
          showHiddenElement(auroraContainer)
          dawnSkyParts.forEach(part => hideVisibleElement(part))
        }

    });
  }, { threshold: 0.3, root: null }); // 1.0 means fully in the viewport

  observer.observe(dawnSkyContainer);
}

function animateClocks() {
  const clocks = document.querySelectorAll('.clock')

  clocks.forEach(clock => {
    let observer = new IntersectionObserver(function(entries) {
      entries.forEach(entry => {
          if (entry.isIntersecting) {
            clock.querySelector('.minute-hand').style.animationPlayState = 'running';
            clock.querySelector('.hour-hand').style.animationPlayState = 'running';
          }
          else {
            clock.querySelector('.minute-hand').style.animationPlayState = 'paused';
            clock.querySelector('.hour-hand').style.animationPlayState = 'paused';
          }

      });
    }, { threshold: 0.1, root: null }); // 1.0 means fully in the viewport

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
