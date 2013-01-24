require 'rails/generators/named_base'
require 'rails/generators/resource_helpers'

module Fira
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:
      protected

      def format
        :html
      end

      def handler
        :fi
      end

      def filename_with_extensions(name)
        [name, format, handler].compact.join(".")
      end
    end

    class ControllerGenerator < Base
      argument :actions, :type => :array, :default => [], :banner => "action action"

      def copy_view_files
        base_path = File.join("app/views", class_path, file_name)
        empty_directory base_path

        actions.each do |action|
          @action = action
          @path = File.join(base_path, filename_with_extensions(action))
          template filename_with_extensions(:view), @path
        end
      end
    end

    class ScaffoldGenerator < Base
      include Rails::Generators::ResourceHelpers

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      def create_root_folder
        empty_directory File.join("app/views", controller_file_path)
      end

      def copy_view_files
        available_views.each do |view|
          filename = filename_with_extensions(view)
          template filename, File.join("app/views", controller_file_path, filename)
        end
      end

    protected

      def available_views
        %w(index edit show new _form)
      end
    end

    class MailerGenerator < ControllerGenerator
      protected

      def format
        :text
      end
    end

  end
end
