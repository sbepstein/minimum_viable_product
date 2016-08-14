require 'bootstrap-sass'
require 'browserify-rails'
require 'client_side_validations'
require 'client_side_validations/simple_form'
require 'cloudinary'
require 'font-awesome-sass'
require 'geocoder'
require 'hashie'
require 'jquery-rails'
require "simple_form"

require_relative './ext/nil'
require_relative './ext/string'

module Mvp
  class Engine < ::Rails::Engine
    isolate_namespace Mvp
    config.autoload_paths << "#{Rails.root}/lib"
  end
end
