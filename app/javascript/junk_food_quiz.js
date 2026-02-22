var COLOR_CLASSES = ['bg-bauhaus-red', 'bg-bauhaus-orange', 'bg-bauhaus-green', 'bg-bauhaus-blue'];

document.addEventListener('turbo:frame-render', function () {
  var source = document.querySelector('[data-circle-colors]');
  if (!source) return;

  var newColors = source.dataset.circleColors.split(',');
  var circles = document.querySelectorAll('.category-circle');

  circles.forEach(function (circle, i) {
    var targetClass = newColors[i];
    if (!targetClass) return;

    COLOR_CLASSES.forEach(function (cls) { circle.classList.remove(cls); });
    circle.classList.add(targetClass);
  });
});
