require 'rspec'
require 'fira'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end

def simple
  <<-FIRA
    <p #id .class3>some text</p>
  FIRA
end

def res_simple
  <<-FIRA
    <p id="id" class="class3">some text</p>
  FIRA
end

def multi_line
  <<-FIRA
    <p #id .class3>
      some text
    </p>
  FIRA
end

def res_multi_line
  <<-FIRA
    <p id="id" class="class3">
      some text
    </p>
  FIRA
end

def nested_single_line
  <<-FIRA
    <p #id .class3><span #span .one>some text</span>
      some text
    </p>
  FIRA
end

def res_nested_single_line
  <<-FIRA
    <p id="id" class="class3"><span id="span" class="one">some text</span>
      some text
    </p>
  FIRA
end

def two_classes
    <<-FIRA
    <p #id .class3 .class4>
      some text
    </p>
  FIRA
end

def res_two_classes
    <<-FIRA
    <p id="id" class="class3 class4">
      some text
    </p>
  FIRA
end

def nested_multi_line
  <<-FIRA
    <p #id .class3>
      <span #span8 .one>some text</span>
      some text
      <input type='text' #user value='user' .orange />
    </p>
  FIRA
end

def res_nested_multi_line
  <<-FIRA
    <p id="id" class="class3">
      <span id="span8" class="one">some text</span>
      some text
      <input  id="user"  class="orange"  type='text' value='user'/>
    </p>
  FIRA
end

def inside_text
  <<-FIRA
    <p #id .class3>#span .one some text
      #span .one some text
      <span>.one #span some text</span>
    </p>
  FIRA
end

def res_inside_text
  <<-FIRA
    <p id="id" class="class3">#span .one some text
      #span .one some text
      <span>.one #span some text</span>
    </p>
  FIRA
end

def inside_quotes
  <<-FIRA
    <p rel="something .steve and #an id" #id .class3>
      some text
    </p>
  FIRA
end

def res_inside_quotes
  <<-FIRA
    <p  id="id" class="class3" rel="something .steve and #an id">
      some text
    </p>
  FIRA
end

def erb
  <<-FIRA
    <span #my-id><% something.id %></span>
    <p #id .class3 >
      some text
    </p>
  FIRA
end

def res_erb
  <<-FIRA
    <span id="my-id"><% something.id %></span>
    <p id="id" class="class3" >
      some text
    </p>
  FIRA
end

def erb_in_tag
  <<-FIRA
    <span #my-id class="<%= something.id %>" ></span>
    <p #id .class3 >
      some text
    </p>
  FIRA
end

def res_erb_in_tag
  <<-FIRA
    <span id="my-id"  class="<%= something.id %>" ></span>
    <p id="id" class="class3" >
      some text
    </p>
  FIRA
end