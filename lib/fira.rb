require "fira/version"

module Fira

  def self.render(template)
  	text = template.inspect
    @engine = Fira::Engine.new
    output = @engine.parse_text(text)
    debugger output
    return output
  end

end

require 'fira/engine'
require 'fira/helpers'