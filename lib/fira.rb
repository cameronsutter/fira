require "fira/version"

module Fira

  def self.render(source)
    engine = Fira::Engine.new(source)
    engine.parse_text
  end

end

require 'fira/engine'
require 'fira/helpers'
require 'fira/fira-rails'