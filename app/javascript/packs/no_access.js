document.addEventListener('DOMContentLoaded', () => {
    const noAccessMessage = document.getElementById('no-access-message');
    if (noAccessMessage) {
      alert(noAccessMessage.textContent.trim());
    }
  });
  