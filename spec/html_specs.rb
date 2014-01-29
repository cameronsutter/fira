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
      <input  id="user"   class="orange" type='text' value='user'/>
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

def html_comments
  <<-FIRA
    <div class="span12">
      <h1><%= @applicant.first_name + " " + @applicant.last_name %>, you are applying for: </h1>
      <h3><span .main-color><%= @position.name %></span> @ <%= @position.client.name %></h3>
  <!--  <div .user-info>
        <h2><a href="/dashboard"><%= @applicant.first_name + " " + @applicant.last_name %></a></h2>
        <button type="button" .button .edit-profile>Edit</button>
      </div> -->
    </div>
  FIRA
end

def res_html_comments
  <<-FIRA
    <div  class="span12">
      <h1><%= @applicant.first_name + " " + @applicant.last_name %>, you are applying for: </h1>
      <h3><span class="main-color"><%= @position.name %></span> @ <%= @position.client.name %></h3>
  <!--  <div .user-info>
        <h2><a href="/dashboard"><%= @applicant.first_name + " " + @applicant.last_name %></a></h2>
        <button type="button" .button .edit-profile>Edit</button>
      </div> -->
    </div>
  FIRA
end

def data_attribute_simple
  <<-FIRA
    <span $convo-id="72" ></span>
  FIRA
end

def res_data_attribute_simple
  <<-FIRA
    <span   data-convo-id="72"></span>
  FIRA
end

def data_attribute_multiple
  <<-FIRA
    <span $convo-id="72" $city="Provo" ></span>
  FIRA
end

def res_data_attribute_multiple
  <<-FIRA
    <span    data-convo-id="72" data-city="Provo"></span>
  FIRA
end

def multiline_opening_tag
  <<-FIRA
<button
    .btn .btn-primary .btn-large
    #finish-new-money
    $user-id="<%= @user.id %>"
  >Done!</button>
  FIRA
end

def res_multiline_opening_tag
  <<-FIRA
<button
    id="finish-new-money"
     class="btn btn-primary btn-large" data-user-id="<%= @user.id %>"
  >Done!</button>
  FIRA
end