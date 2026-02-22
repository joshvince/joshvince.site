document.addEventListener('turbo:load', function () {
  var canvas = document.getElementById('emoji-canvas');
  if (!canvas) return;

  var hose = EmojiSpray(canvas, canvas.parentElement);
  hose.spray();
});
