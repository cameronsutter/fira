module Fira

	class Engine

		ID_PATTERN = /(<.*)#([a-z_A-Z\-]+)(.*>.*<\/.*>)/
		CLASS_PATTERN = /\.([a-z_A-Z\-]+)/
		TAG_PATTERN = /<.*>/
		OPEN_TAG_PATTERN = /(<.*>)(.*<\/.*>)/

		#begin parsing text
		def parse_text(contents)
			
			#find id's
			result = parse_ids(contents)
			
			#find classes
			output = parse_classes(result)
				
		end

		#scan for ids and replace with html id attributes
		def parse_ids(contents)

			result = contents.gsub(ID_PATTERN, '\1 id="\2" \3')
		end

		#scan for classes and create html class attributes
		def parse_classes(contents)

			result = contents
			
			#scan for classes
			tags = contents.scan(TAG_PATTERN)
			tags.each do |tag|

				open_tag = tag.scan(OPEN_TAG_PATTERN)

				classes = open_tag[0][0].scan(CLASS_PATTERN)

				if ! classes.empty?
				
					#build a class attribute
					att = "class='"
				
					classes.each do |cl|
						att += " #{cl[0]}"
					end
					
					att += "'"
					
					#remove the space before the first class
					att = att.sub(/class=' /, "class='")
					
					#remove the fira class attributes
					new_open_tag = open_tag[0][0].gsub(CLASS_PATTERN, "")

					#save the html class attributes back into the tag
					new_open_tag = new_open_tag.sub(/>/,att + "\\0")
					
					#replace the old opening tag with the new
					new_tag = tag.gsub(OPEN_TAG_PATTERN, new_open_tag + '\2')
					
					#save the whole html tag back into the file
					result = result.sub(tag, new_tag)
				end
			end
			
			return result
		end
		
	end
end