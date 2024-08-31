document.addEventListener("turbolinks:load", function() {
  var alertDiv = document.getElementById('permission-alert');
  if (alertDiv) {
      alert(alertDiv.dataset.message);
  }
});

