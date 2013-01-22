require 'action_view/template'

module Fira

  class FiraHandler
      include Compilable

      def initialize(template)
        logger.info "initialize #{template.inspect}"
        @template = template
      end

      def render(contents, local_assigns = {})
        logger.info "RENDER #{contents}"
        return Fira::render(contents)
      end

      def self.call(template)
        logger.info "CALL #{template.inspect}"
        return Fira::render(template)
      end

      #The next several methods are taken from the Erubis Template Handler erb.erb in action_view
      def add_preamble(src)
        src << "@output_buffer = output_buffer || ActionView::OutputBuffer.new;"
      end

      def add_text(src, text)
        return if text.empty?
        src << "@output_buffer.safe_concat('" << escape_text(text) << "');"
      end

      BLOCK_EXPR = /\s+(do|\{)(\s*\|[^|]*\|)?\s*\Z/

      def add_expr_literal(src, code)
        if code =~ BLOCK_EXPR
          src << '@output_buffer.append= ' << code
        else
          src << '@output_buffer.append= (' << code << ');'
        end
      end

      def add_expr_escaped(src, code)
        if code =~ BLOCK_EXPR
          src << "@output_buffer.safe_append= " << code
        else
          src << "@output_buffer.safe_concat((" << code << ").to_s);"
        end
      end

      def add_postamble(src)
        src << '@output_buffer.to_s'
      end
  end
  handler_klass = Fira::FiraHandler
  ActionView::Template::register_default_template_handler :fi, handler_klass
end
# module ActionView
#   module TemplateHandlers
#     class FiraHandler < TemplateHandler
      
#       def initialize(template)
#         @template = template
#       end

#       def render(contents, local_assigns = {})
#         return Fira::render(contents)
#       end
#     end
#   end
#   handler_klass = TemplateHandlers::FiraHandler
#   Template.register_default_template_handler :fi, handler_klass
# end