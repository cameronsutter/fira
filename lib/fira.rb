require "fira/version"

module Fira

  def self.render(template)
  	text = template.source
  	logger.info "FIRA Render #{text}"
    @engine = Fira::Engine.new
    output = @engine.parse_text(text)
    logger.info "FIRA Render #{output}"
    return output
  end

end

require 'fira/engine'
require 'fira/helpers'