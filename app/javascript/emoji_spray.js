var EMOJIS = [
  '🍕', '🍔', '🍟', '🍩', '🍿',
  '😡', '😡', '😤', '😤', '😢', '😢', '😰', '😰',
  '🤬', '🤬', '😞', '😞', '💀', '💀', '🫠', '🫠',
  '😭', '😭', '🥺', '😠', '😠', '🤮', '😵', '😵‍💫',
  '💔', '💔', '😩', '😩', '😤', '🙄', '🙄',
  '😶‍🌫️', '🫥', '😮‍💨', '😮‍💨',
];

var SIZE_CLASSES = ['emoji-sm', 'emoji-md', 'emoji-md', 'emoji-lg', 'emoji-xl'];

var SPAWN_DURATION = 2500;
var SPAWN_RATE = 12;
var GRAVITY = 0.15;

window.EmojiSpray = function (canvas, container) {
  var particles = [];
  var spawning = false;
  var animating = false;
  var spawnTimer = null;
  var spawnAccumulator = 0;
  var lastTime = 0;

  function createParticle() {
    var el = document.createElement('span');
    el.className =
      'emoji-particle ' +
      SIZE_CLASSES[Math.floor(Math.random() * SIZE_CLASSES.length)];
    el.textContent = EMOJIS[Math.floor(Math.random() * EMOJIS.length)];
    canvas.appendChild(el);

    var angle = Math.PI + (Math.random() - 0.5) * 1.2;
    var speed = 8 + Math.random() * 10;
    var spawnX = container.offsetWidth || window.innerWidth;
    var spawnY = (container.offsetHeight || window.innerHeight) * 0.5;

    return {
      el: el,
      x: spawnX,
      y: spawnY + (Math.random() - 0.5) * 60,
      vx: Math.cos(angle) * speed,
      vy: Math.sin(angle) * speed,
      rotation: Math.random() * 360,
      rotationSpeed: (Math.random() - 0.5) * 8,
      opacity: 1,
      life: 0,
    };
  }

  function tick(now) {
    if (!animating) return;

    var dt = Math.min(now - lastTime, 50);
    lastTime = now;

    if (spawning) {
      spawnAccumulator += (SPAWN_RATE * dt) / 1000;
      while (spawnAccumulator >= 1) {
        particles.push(createParticle());
        spawnAccumulator -= 1;
      }
    }

    var maxY = (container.offsetHeight || window.innerHeight) + 50;

    for (var i = particles.length - 1; i >= 0; i--) {
      var p = particles[i];
      p.life += dt;
      p.vy += GRAVITY;
      p.x += p.vx;
      p.y += p.vy;
      p.rotation += p.rotationSpeed;

      if (p.life > 2000) {
        p.opacity = Math.max(0, 1 - (p.life - 2000) / 1000);
      }

      p.el.style.transform =
        'translate(' + p.x + 'px,' + p.y + 'px) rotate(' + p.rotation + 'deg)';
      p.el.style.opacity = p.opacity;

      if (p.opacity <= 0 || p.y > maxY) {
        p.el.remove();
        particles.splice(i, 1);
      }
    }

    if (!spawning && particles.length === 0) {
      animating = false;
      return;
    }

    requestAnimationFrame(tick);
  }

  return {
    spray: function () {
      if (spawning) return;

      spawning = true;
      spawnAccumulator = 0;
      lastTime = performance.now();

      if (!animating) {
        animating = true;
        requestAnimationFrame(tick);
      }

      clearTimeout(spawnTimer);
      spawnTimer = setTimeout(function () {
        spawning = false;
      }, SPAWN_DURATION);
    },
  };
};
