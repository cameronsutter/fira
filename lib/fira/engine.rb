module Fira

	class Engine

		@tag_pattern = /<.*>/
		@id_pattern = /(#)([a-z_A-Z\-]+)/
		@class_pattern = /\.([a-z_A-Z\-]+)/

		#open the file and begin parsing it
		def parse_file(contents)
			
			#find id's
			result = parse_ids(contents)
			
			#find classes
			output = parse_classes(result)
				
		end

		#scan for ids and replace with html id attributes
		def parse_ids(string)
			result = contents.gsub(@id_pattern, 'id="\2"')
		end

		#scan for classes and create html class attributes
		def parse_classes(string)
			
			result = contents
			
			#scan for classes
			tags = contents.scan(@tag_pattern)
			tags.each do |tag|
				
				classes = tag.scan(@class_pattern)
				
				if ! classes.empty?
				
					#build a class attribute
					att = "class='"
				
					classes.each do |cl|
						att += " #{cl[0]}"
					end
					
					att += "'"
					
					#remove the space before the first class
					att = att.sub(/class=' /, "class='")
					
					#remove the eml class attributes
					new_tag = tag.gsub(@class_pattern, "")
					
					#save the html class attributes back into the tag
					new_tag = new_tag.sub(/>/,att + "\\0")

					#save the whole html tag back into the file
					result = result.sub(tag, new_tag)
				end
			end
			
			return result
		end
		
	end
end