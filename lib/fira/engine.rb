require_relative 'tokenizer'
require_relative 'lexer'

module Fira

	class Engine

		def initialize(text)
			@source = text
		end

		def parse_text
			tok = Tokenizer.new(@source)
	    cont = true
	    tokens = []
	    while cont
	      token = tok.read_next_token
	      tokens << token
	      cont = false if token.nil?
	    end

	    lex = Lexer.new(tokens)
	    lex.analyze
		end

	end
end