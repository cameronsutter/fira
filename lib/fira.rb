require "fira/version"

module Fira

  def self.render(template)
  	text = template.source
    @engine = Fira::Engine.new
    output = @engine.parse_text(text)
    return output
  end

end

require 'fira/engine'
require 'fira/helpers'