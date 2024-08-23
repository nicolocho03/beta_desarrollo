
namespace :import do
  desc "Importa proveedores desde un archivo CSV"
  task providers: :environment do
    require 'csv'

    file_path = 'lib/assets/Providers.csv'

    if File.exist?(file_path)
      CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
        provider = Provider.find_or_initialize_by(nit: row[:nit])
        provider.name = row[:name]
        if provider.save
          puts "Proveedor importado: #{provider.name}"
        else
          puts "Error al importar proveedor: #{provider.errors.full_messages.join(', ')}"
        end
      end
      puts "Importación completada."
    else
      puts "El archivo #{file_path} no existe."
    end
  end
end
