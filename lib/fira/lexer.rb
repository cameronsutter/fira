require_relative 'token'

class Lexer
  def initialize(tokens)
    @tokens = tokens
    @output = ""
    @class_buffer = []
  end

  def analyze
    @tokens.each do |token|
      handle_unsure token unless token.nil?
    end
    @output
  end

  private

    def handle_token(token)
      if token.type === TokenType::CSS_CLASS
        handle_css_class token
      elsif token.type === TokenType::ID
        handle_id token
      elsif token.type === TokenType::CLOSE_ANGLE_BRACKET
        handle_close token
      else
        handle_text token
      end
    end

    def handle_array(arr)
      arr.each do |tok|
        handle_unsure tok
      end
    end

    def handle_unsure(something)
      if something.is_a?(Array)
        handle_array something
      else
        handle_token something
      end
    end

    def handle_text(token)
      @output << token.val
    end

    def handle_id(token)
      @output << "id='#{token.val}'"
    end

    def handle_close(token)
      if @class_buffer.length > 0
        text = "class='"
        text << @class_buffer.join(" ")
        text << "' "
        @output << text
        clear_class_buffer
      end
      @output << token.val
    end

    def handle_css_class(token)
      @class_buffer << token.val
    end

    def clear_class_buffer
      @class_buffer = []
    end

end