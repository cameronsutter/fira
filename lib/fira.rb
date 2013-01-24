require "fira/version"

module Fira

  def self.render(source)
    @engine = Fira::Engine.new
    output = @engine.parse_text(source)
    return output
  end

end

require 'fira/engine'
require 'fira/helpers'
require 'fira/fira-rails'