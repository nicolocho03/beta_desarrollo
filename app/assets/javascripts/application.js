//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require no_access
//= require sidebar
//= require bills

document.addEventListener('DOMContentLoaded', function() {
    var input = document.getElementById('provider_nit');
  
    if (input) {
      $(input).autocomplete({
        source: input.dataset.autocomplete_source,
        select: function(event, ui) {
          $('#bill_providers_id').val(ui.item.value); // Asigna el id del proveedor al campo oculto
        }
      });
    }
  });
  


