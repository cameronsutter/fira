#!/usr/bin/env ruby

ID_PATTERN = /(<[^\/]?.*)#([a-z_A-Z\-]+)/
CLASS_PATTERN = /\.([a-z_A-Z\-]+)/
TAG_PATTERN = /<[^\/]?.*>/

#begin parsing text
def parse_text(contents)
	
	#find id's
	result = parse_ids(contents)
	
	#find classes
	output = parse_classes(result)
		
end

#scan for ids and replace with html id attributes
def parse_ids(contents)

	result = contents.gsub(ID_PATTERN, '\1 id="\2"')
end

#scan for classes and create html class attributes
def parse_classes(contents)

	result = contents
	
	#scan for classes
	tags = contents.scan(TAG_PATTERN)
	tags.each do |tag|

		classes = tag.scan(CLASS_PATTERN)


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
			new_tag = tag.gsub(CLASS_PATTERN, "")

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
		
		result = parse_text(contents)
		
		#make the new file's name
		new_file = fi.sub(/(\.fira$|\.html.fira$)/, ".html")
		
		File.open(new_file, "w") { |nf| nf.write(result)}
	}
end