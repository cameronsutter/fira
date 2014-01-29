require 'action_controller'

module Fira

	class Engine


		ID_REGEX = / #([^0-9][a-z_A-Z0-9_\-]+)/
		CLASS_REGEX = / \.([^0-9][a-z_A-Z0-9_\-]+)/
		QUOTE_REGEX = /\S+=["']?(?:.(?!["']?\s+(?:\S+)=|[>"']))+.["']?/
		TAG_OPEN_REGEX = /<[^\/%!]\w* /x
		TAG_END_REGEX = /([\/]?>)/

		def parse_text(text)
			output = ""
			tokenizer = HTML::Tokenizer.new(text)
			while token = tokenizer.next

				#if it's an opening tag, analyze it
				if is_opening_tag?(token)

					#remove any quotes
					quotes = token.scan(QUOTE_REGEX)
					no_quotes = token.gsub(QUOTE_REGEX, '')

					#find and replace fira ID attributes
					result = no_quotes.sub(ID_REGEX, ' id="\1"')

					#find and replace fira class attributes
					result = parse_classes(result)

					#add back in the quotes
					output += insert_quotes(quotes, result)

					#find and replace fira data attributes
					output = output.gsub("\$", "data-")

				else
					output += token
				end
			end

			return output.gsub( /\s+/, " " )
		end

		def parse_classes(text)
			#find fira class attributes
			classes = text.scan(CLASS_REGEX)

			if classes.empty?
				return text
			end

			#build an HTML class attribute
			att = 'class="'

			classes.each do |cl|
				att += " #{cl[0]}"
				text = text.sub(" ." + cl[0], "")
			end

			att += '"'

			#remove the space before the first class
			att = att.sub(/class=" /, ' class="')

			text.sub(TAG_END_REGEX, att + '\1')
		end

		def insert_quotes(_quotes, tag)
			space = ''
			space = ' ' if _quotes.length > 0
			quotes = _quotes.join(" ")
			tag.sub(TAG_END_REGEX, space + quotes + '\1')
		end

		def is_opening_tag?(text)
			val = text =~ TAG_OPEN_REGEX
			val.nil? || val > 0 ? false : true
		end


	end
end