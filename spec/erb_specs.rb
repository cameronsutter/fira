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
    <p id="id"  class="class3">
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
    <p id="id"  class="class3">
      some text
    </p>
  FIRA
end