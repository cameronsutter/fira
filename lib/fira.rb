require "fira/version"

module Fira

  def self.render(text)
    @engine = Fira::Engine.new
    output = @engine.parse_file(text)
    output.inspect
    return output
  end

end

require 'fira/engine'
require 'fira/helpers'