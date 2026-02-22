document.addEventListener('DOMContentLoaded', function () {
  setTimeout(function () {
    document.getElementById('open-wide').classList.remove('is-invisible');
  }, 1000);

  var canvas = document.getElementById('emoji-canvas');
  if (!canvas) return;

  var hose = EmojiSpray(canvas, canvas.parentElement);
  hose.spray();

  var trigger = document.getElementById('open-wide');
  var introContent = document.getElementById('intro-content');

  if (trigger) {
    trigger.addEventListener('click', function () {
      hose.spray();

      if (introContent) {
        introContent.classList.remove('is-hidden');
        introContent.offsetHeight;
        introContent.classList.remove('is-invisible');
        introContent.scrollIntoView({ behavior: 'smooth' });
      }
    });
  }
});
