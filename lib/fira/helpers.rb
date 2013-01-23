require 'action_view/template'
require 'erubis'

module Fira

  class FiraHandler

      def initialize
        
      end

      def render(contents, local_assigns = {})
        return Fira::render(contents)
      end

      def self.call(template)
        new.call(template)
      end

      def call(template)

        results = Fira::render(template.source)

        input = ActionView::Template::new(results, template.identifier, template.handler, {:format => template.formats[0]})
        output = ActionView::Template::Handlers::ERB::call(input)
      end

  end
  handler_klass = Fira::FiraHandler
  ActionView::Template::register_default_template_handler :fi, handler_klass
end