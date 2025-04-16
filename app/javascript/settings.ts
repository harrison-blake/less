document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.getElementById("settingsToggle");
  const menu = document.getElementById("settingsMenu");

  if (!toggle || !menu) return;

  toggle.addEventListener("click", (e) => {
    e.stopPropagation();
    menu.classList.toggle("hidden");
  });

  document.addEventListener("click", (e) => {
    if (!menu.contains(e.target as Node) && e.target !== toggle) {
      menu.classList.add("hidden");
    }
  });
});
