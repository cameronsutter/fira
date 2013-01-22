require "fira/version"

module Fira

  def self.render(template)
  	text = template.source
  	#debug "FIRA Render #{text}"
  	$stdout.puts "FIRA Render #{text}"
    @engine = Fira::Engine.new
    output = @engine.parse_text(text)
    #debug "FIRA Render #{output}"
    return output
  end

end

require 'fira/engine'
require 'fira/helpers'