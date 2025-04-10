document.addEventListener("DOMContentLoaded", () => {
  const greetingEl = document.getElementById("greeting");

  if (!greetingEl) return;

  const hours = new Date().getHours();
  let greeting: string;

  if (hours < 12) {
    greeting = "Good morning";
  } else if (hours < 18) {
    greeting = "Good afternoon";
  } else {
    greeting = "Good evening";
  }

  greetingEl.textContent = `${greeting}, welcome back!`;
});