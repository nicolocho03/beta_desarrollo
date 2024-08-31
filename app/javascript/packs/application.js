import $ from 'jquery';
import 'jquery-ui/ui/widgets/autocomplete';
import '../stylesheets/application.css';
import '../stylesheets/devise.css';
import '../stylesheets/bills.css';
import '../stylesheets/bills_visualization.css';
import Turbolinks from 'turbolinks';
Turbolinks.start();
import './sidebar';
import './no_access';
import './bills_permission_alert';



document.addEventListener("DOMContentLoaded", function() {
  $('#nit_field').autocomplete({
    source: function(request, response) {
      $.ajax({
        url: $('#nit_field').data('autocomplete-source'),
        dataType: 'json',
        data: {
          term: request.term
        },
        success: function(data) {
          response(data);
        }
      });
    },
    minLength: 2,
    select: function(event, ui) {
      // Al seleccionar un NIT, almacenar el id en el campo oculto
      $('#bill_providers_id').val(ui.item.value);
    }
  });
});

