require 'rails/generators/erb/controller/controller_generator'
require 'rails/generators/erb/scaffold/scaffold_generator'

module Fira
  module Generators
    class ControllerGenerator < Erb::Generators::ControllerGenerator
      source_root File.expand_path("../templates", __FILE__)

    protected

      def handler
        :fira
      end

    end

    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      source_root File.expand_path("../templates", __FILE__)

      def copy_view_files
        available_views.each do |view|
          filename = filename_with_extensions(view)
          template "#{view}.html.haml", File.join("app/views", controller_file_path, filename)
        end
      end

      hook_for :form_builder, :as => :scaffold

      def copy_form_file
        if options[:form_builder].nil?
          filename = filename_with_extensions("_form")
          template "_form.html.haml", File.join("app/views", controller_file_path, filename)
        end
      end

    protected

      def available_views
        %w(index edit show new)
      end

      def handler
        :fira
      end

    end

    class MailerGenerator < ControllerGenerator
      source_root File.expand_path("../templates", __FILE__)

    protected

      def format
        :text
      end

    end

  end
end
