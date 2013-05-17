require 'action_controller'

module Fira

	class Engine


		ID_REGEX = / #([^0-9][a-z_A-Z0-9_\-]+)/
		CLASS_REGEX = / \.([^0-9][a-z_A-Z0-9_\-]+)/
		QUOTE_REGEX = /\S+=["']?(?:.(?!["']?\s+(?:\S+)=|[>"']))+.["']?/
		TAG_END_REGEX = /([\/]?>)/

		def parse_text(text)
			output = ""
			tokenizer = HTML::Tokenizer.new(text)
			while token = tokenizer.next
				#if it's an opening tag, analyze it
				if token[0] == "<" and token[token.length - 1] == ">" and token[1] != "/"

					#remove any quotes
					quotes = token.scan(QUOTE_REGEX)
					no_quotes = token.gsub(QUOTE_REGEX, '')

					#find and replace fira ID attributes
					result = no_quotes.sub(ID_REGEX, ' id="\1"')

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

						#add back in the quotes
						final = insert_quotes(quotes, final_result)
					else
						#add back in the quotes
						final = insert_quotes(quotes, result)
					end
						
					output += final

				else
					output += token
				end
			end

			return output
		end

		def insert_quotes(_quotes, tag)
			space = ''
			space = ' ' if _quotes.length > 0
			quotes = _quotes.join(" ")
			tag.sub(TAG_END_REGEX, space + quotes + '\1')
		end
		
		
	end
end