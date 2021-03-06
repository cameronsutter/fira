#!/usr/bin/env ruby

ID_REGEX = / #([a-z_A-Z\-]+)/
CLASS_REGEX = / \.([a-z_A-Z\-]+)/

def parse_text(text)
	output = ""
	tokenizer = HTML::Tokenizer.new(text)
	while token = tokenizer.next
		if token[0] == "<" and token[token.length - 1] == ">" and token[1] != "/"
			#if it's an opening tag, analyze it

			#find and replace fira ID attribute
			result = token.sub(ID_REGEX, ' id="\1"')

			#find fira class attributes
			classes = result.scan(CLASS_REGEX)

			if ! classes.empty?
			
				#build an HTML class attribute
				att = 'class="'
			
				classes.each do |cl|
					att += " #{cl[0]}"
				end
				
				att += '"'
				
				#remove the space before the first class
				att = att.sub(/class=" /, ' class="')

				#remove the first fira class attribute
				new_tag = result.sub(CLASS_REGEX, att)
				
				#remove the rest of the fira class attributes
				final_result = new_tag.gsub(CLASS_REGEX, "")

				output += final_result
			else
				output += result
			end

		else
			output += token
		end
	end

	return output
end



#####################
# START HERE
#####################

files = []
ARGV.each do |a|
	files.push a
end

files.each do |fi|
	File.open(fi, 'r+'){
		|f|
		contents = f.read
		
		result = parse_text(contents)
		
		#make the new file's name
		new_file = fi.sub(/(\.fira$|\.html.fira$)/, ".html")
		
		File.open(new_file, "w") { |nf| nf.write(result)}
	}
end