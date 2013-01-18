module ActionView
  module TemplateHandlers
    class FiraHandler < TemplateHandler
      
      def initialize(template)
        @template = template
      end

      def render(contents, local_assigns = {})
        return Fira::render(contents)
      end
    end
  end
  handler_klass = TemplateHandlers::FiraHandler
  Template.register_default_template_handler :fi, handler_klass
end