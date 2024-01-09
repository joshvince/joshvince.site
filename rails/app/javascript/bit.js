document.addEventListener("DOMContentLoaded", function() {
  transitionIntoAurora();
  transitionIntoDawn();
});

function transitionIntoAurora() {
  let nightSkyParts = document.querySelectorAll(".night-sky div");
  let auroraContainer = document.querySelector(".aurora");

  let observer = new IntersectionObserver(function(entries) {
      entries.forEach(entry => {
          if (entry.isIntersecting) {
            auroraContainer.style.opacity = 1;
            nightSkyParts.forEach(part => { part.style.opacity = 0; })
          }
          else {
            auroraContainer.style.opacity = 0;
            nightSkyParts.forEach(part => { part.style.opacity = 1; })
          }

      });
  }, { threshold: 0.2 }); // 1.0 means fully in the viewport

  observer.observe(auroraContainer);
}

function transitionIntoDawn() {
  let auroraContainer = document.querySelector(".aurora");
  let dawnSkyContainer = document.querySelector(".dawn-sky");
  let dawnSkyParts = document.querySelectorAll(".dawn-sky div");

  let observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
          auroraContainer.style.opacity = 0;
          dawnSkyParts.forEach(part => {
            part.style.opacity = 1;
            part.style.background = `linear-gradient(180deg, var(--midnight), var(--dawn))`;
          })
        }
        else {
          auroraContainer.style.opacity = 1;
          dawnSkyParts.forEach(part => { part.style.opacity = 0; })
        }

    });
  }, { threshold: 0.3 }); // 1.0 means fully in the viewport

  observer.observe(dawnSkyContainer);
}
