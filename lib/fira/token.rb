class TokenType
  TEXT=0
  OPEN_ANGLE_BRACKET=1
  CLOSE_ANGLE_BRACKET=2
  CLOSE_TAG=3
  CSS_CLASS=4
  ID=5
  DATA_ATTR=6
  ERB=7
  WHITESPACE=8
  ATTR=9
end

class Token
  def initialize(token_type, string)
    @type = token_type
    @value = string
  end

  def type
    @type
  end

  def val
    @value
  end

  def equals(type, val)
    @type == type && @value == val
  end
end