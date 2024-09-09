document.addEventListener('turbolinks:load', () => {
    const nitInput = document.getElementById('nit_field');
    const suggestionsBox = document.getElementById('nit_suggestions');
  
    if (nitInput) {
      nitInput.addEventListener('input', function() {
        const nit = this.value;
        
        // Si el NIT tiene al menos 2 caracteres
        if (nit.length >= 2) {
          fetch(`/autocomplete_providers?nit=${encodeURIComponent(nit)}`)
            .then(response => response.json())
            .then(data => {
              suggestionsBox.innerHTML = ''; // Limpiar las sugerencias anteriores
              if (data.length > 0) {
                data.forEach(provider => {
                  const suggestionItem = document.createElement('div');
                  suggestionItem.classList.add('suggestion-item');
                  suggestionItem.textContent = `${provider[0]} - ${provider[1]}`; // Muestra NIT y nombre
  
                  // Añadir un listener para cuando se seleccione una sugerencia
                  suggestionItem.addEventListener('click', () => {
                    nitInput.value = provider[0]; // Asigna el NIT seleccionado al campo
                    document.getElementById('provider-name').value = provider[1]; // Muestra el nombre en otro campo
                    suggestionsBox.innerHTML = ''; // Limpia las sugerencias
                  });
  
                  suggestionsBox.appendChild(suggestionItem);
                });
              } else {
                suggestionsBox.innerHTML = '<div class="no-suggestions">No hay resultados</div>';
              }
            })
            .catch(error => console.error('Error fetching provider suggestions:', error));
        } else {
          suggestionsBox.innerHTML = ''; // Limpiar sugerencias si el input es muy corto
        }
      });
    }
  });
  