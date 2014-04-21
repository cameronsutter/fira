require_relative '../lib/fira/tokenizer'
require_relative '../lib/fira/lexer'

ARGV.each do |fi|
	File.open(fi, 'r+'){
		|f|
		contents = f.read

		tok = Tokenizer.new(contents)
    cont = true
    tokens = []
    while cont
      token = tok.read_next_token
      tokens << token
      cont = false if token.nil?
    end

    lex = Lexer.new(tokens)
    result = lex.analyze

		#make the new file's name
		new_file = fi.sub(/(\.fira$|\.html.fira$)/, ".html")

		File.open(new_file, "w") { |nf| nf.write(result)}
	}
end