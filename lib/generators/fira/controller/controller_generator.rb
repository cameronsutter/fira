require 'rails/generators/erb/controller/controller_generator'

module Fira
  module Generators
    class ControllerGenerator < Erb::Generators::ControllerGenerator
      source_root File.expand_path("../templates", __FILE__)

    protected

      def handler
        :fira
      end

    end
  end
end