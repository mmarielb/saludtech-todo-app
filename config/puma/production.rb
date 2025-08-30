# config/puma/production.rb

workers Integer(ENV.fetch('WEB_CONCURRENCY') { 2 })
threads_count = Integer(ENV.fetch('RAILS_MAX_THREADS') { 5 })
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
environment ENV.fetch('RAILS_ENV') { 'production' }

# Escucha en el puerto asignado por Render
port        ENV.fetch('PORT') { 3000 }

# Permite reinicios suaves de Puma
plugin :tmp_restart
