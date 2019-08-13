require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#here is where I will mount other controllers with 'use'

#in order to send PATCH and DELETE requests this code
use Rack::MethodOverrdide
run ApplicationController
use PostsController
use UsersController
