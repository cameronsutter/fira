require_relative 'token'

class Tokenizer
  def initialize(text)
    return if text.nil? || text == ""
    @source = text
    @output = ""
    @index = 0
    @current_char = ""
    read_next
  end

  def read_next_token
    return nil if end_of_source?

    if @current_char == "<"
      read_tag
    else
      read_text
    end
  end

  private

    def read_next
      @current_char = @source[@index]
      @index += 1
    end

    def store_and_read_next
      return if @current_char.nil?
      @output << @current_char
      read_next
    end

    def end_of_source?
      @current_char.nil? || @index > @source.length
    end

    def extract_stored_chars
      chars = @output
      @output = ""
      chars
    end

    # def skip_whitespace
    #   while @current_char =~ /\s/
    #     read_next
    #   end
    # end

    def read_whitespace
      while @current_char =~ /\s/
        store_and_read_next
      end
      Token.new(TokenType::WHITESPACE, extract_stored_chars)
    end

    def read_text
      while @current_char != "<"
        store_and_read_next
      end
      Token.new(TokenType::TEXT, extract_stored_chars)
    end

    def read_tag
      store_and_read_next

      #closing tag
      if @current_char == "/"
        return read_closing_tag
      end

      #erb tag
      if @current_char == "%"
        return read_erb
      end

      #normal html tag
      tokens = []
      while @current_char =~ /\w/
        store_and_read_next
      end
      tokens << Token.new(TokenType::OPEN_ANGLE_BRACKET, extract_stored_chars)
      tokens << read_whitespace

      while @current_char !~ />/
        token = nil
        tokens << read_whitespace

        if @current_char == "."
          token = read_css_class
        elsif @current_char == "#"
          token = read_id
        elsif @current_char == "$"
          token = read_data
        elsif @current_char == "<" #in-tag erb
          token = read_erb
        elsif @current_char =~ /\w/
          token = read_attribute
        elsif @current_char == "/"
          store_and_read_next
          break
        end

        tokens << token unless token.nil?
      end

      if @current_char == ">"
        store_and_read_next
        tokens << Token.new(TokenType::CLOSE_ANGLE_BRACKET, extract_stored_chars)
      end

      tokens
    end

    def read_closing_tag
      while @current_char !~ />/
        store_and_read_next
      end
      store_and_read_next #store the > as well
      Token.new(TokenType::CLOSE_TAG, extract_stored_chars)
    end

    def read_css_class
      read_next
      while @current_char =~ /(\w|-)/
        store_and_read_next
      end
      Token.new(TokenType::CSS_CLASS, extract_stored_chars)
    end

    def read_id
      read_next
      while @current_char =~ /(\w|-)/
        store_and_read_next
      end
      Token.new(TokenType::ID, extract_stored_chars)
    end

    def read_data
      read_next
      output = [Token.new(TokenType::DATA_ATTR, "data-")]
      output << read_attribute
    end

    def read_erb
      while @current_char !~ />/
        store_and_read_next
      end
      store_and_read_next #store the > as well
      Token.new(TokenType::ERB, extract_stored_chars)
    end

    def read_attribute
      while @current_char != "="
        store_and_read_next
      end
      store_and_read_next #store the =
      quote = @current_char
      begin
        store_and_read_next
      end while @current_char != quote
      store_and_read_next #store the " as well
      Token.new(TokenType::ATTR, extract_stored_chars)
    end
end


# class ParserException < Error

# end