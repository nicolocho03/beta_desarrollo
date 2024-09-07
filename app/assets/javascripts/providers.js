document.addEventListener('turbolinks:load', () => {
  const nitInput = document.getElementById('nit_field');
  const nameInput = document.getElementById('provider-name');
  const providerIdField = document.getElementById('bill_providers_id');

  if (nitInput && nameInput && providerIdField) {
    nitInput.addEventListener('input', function () {
      const nit = this.value;
      if (nit.length > 0) {
        fetch(`/find_provider?nit=${encodeURIComponent(nit)}`)
          .then(response => response.json())
          .then(data => {
            if (data.name) {
              nameInput.value = data.name;
              providerIdField.value = data.id; // Asume que la respuesta incluye el ID del proveedor
            } else {
              nameInput.value = '';
              providerIdField.value = '';
            }
          })
          .catch(error => console.error('Error fetching provider:', error));
      } else {
        nameInput.value = '';
        providerIdField.value = '';
      }
    });
  } else {
    console.error('Element not found: nit_field or provider-name or bill_providers_id');
  }
});



  
  