module Fira

	class Engine


		ID_REGEX = /([^'%"]*)#([a-z_A-Z\-]+)(.*)/
		CLASS_REGEX = /[^'%"]*\.([a-z_A-Z\-]+).*/

		def parse_text(text)
			output = ""
			tokenizer = HTML::Tokenizer.new(text)
			while token = tokenizer.next
				if token[0] == "<" and token[token.length - 1] == ">" and token[1] != "/"
					#if it's an opening tag, analyze it

					#find and replace fira ID attributes
					result = token.sub(ID_REGEX, '\1 id="\2" \3')

					#find fira class attributes
					classes = result.scan(CLASS_REGEX)

					if ! classes.empty?
					
						#build an HTML class attribute
						att = "class='"
					
						classes.each do |cl|
							att += " #{cl[0]}"
						end
						
						att += "'"
						
						#remove the space before the first class
						att = att.sub(/class=' /, "class='")

						#remove the fira class attributes
						#first one
						new_tag = result.sub(CLASS_REGEX, att)
						
						#the rest of the fira class attributes
						output += new_tag.gsub(CLASS_REGEX, "")
					end

				else
					output += token
				end
			end

			return output
		end
		
	end
end