#!/usr/bin/env ruby

#scan for ids and replace with html id attributes
def parse_ids(contents)
	id_pattern = /(#)([a-z_A-Z\-]+)/
	result = contents.gsub(id_pattern, 'id="\2"')
end

#scan for classes and create html class attributes
def parse_classes(contents, tag_pattern)
	class_pattern = /\.([a-z_A-Z\-]+)/
	
	result = contents
	
	#scan for classes
	tags = contents.scan(tag_pattern)
	tags.each do |tag|
		
		classes = tag.scan(class_pattern)
		
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
			new_tag = tag.gsub(class_pattern, "")
			
			#save the html class attributes back into the tag
			new_tag = new_tag.sub(/>/,att + "\\0")

			#save the whole html tag back into the file
			result = result.sub(tag, new_tag)
		end
	end
	
	return result
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

		tag_pattern = /<.*>/
		
		result = parse_ids(contents)
		
		result = parse_classes(result, tag_pattern)
		
		#make the new file's name
		new_file = fi.sub(/\.fi$/, ".html")
		
		File.open(new_file, "w") { |nf| nf.write(result)}
	}
end