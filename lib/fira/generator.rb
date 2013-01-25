require 'rails/generators/erb/controller/controller_generator'
require 'rails/generators/erb/scaffold/scaffold_generator'

module Fira
  module Generators

    class MailerGenerator < ControllerGenerator
      source_root File.expand_path("../templates", __FILE__)

    protected

      def format
        :text
      end

    end

  end
end
