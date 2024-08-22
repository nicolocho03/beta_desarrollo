// sidebar.js

document.addEventListener('turbolinks:load', function() {
  const toggleBtn = document.getElementById('toggle-btn');
  const sidebar = document.getElementById('sidebar');
  const closeBtn = document.getElementById('close-btn');
  const searchBtn = document.getElementById('search-btn');
  const searchInput = document.getElementById('search-input');

  if (toggleBtn && sidebar && closeBtn && searchBtn && searchInput) {
    toggleBtn.addEventListener('click', function() {
      sidebar.classList.toggle('open');
      document.body.classList.toggle('sidebar-open');
    });

    closeBtn.addEventListener('click', function() {
      sidebar.classList.remove('open');
      document.body.classList.remove('sidebar-open');
    });

    searchBtn.addEventListener('click', function() {
      searchInput.classList.toggle('show');
      searchInput.focus();
    });
  }
});





