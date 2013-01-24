require 'fira'
require 'rails'

module Fira
  module Rails
    class Railtie < ::Rails::Railtie
      if ::Rails.version.to_f >= 3.1
        config.app_generators.template_engine :fira
      else
        config.generators.template_engine :fira
      end

    end
  end
end