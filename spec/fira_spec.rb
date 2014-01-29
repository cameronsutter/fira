require 'spec_helper'
require 'html_specs'
require 'erb_specs'

describe Fira do
  specs = %w{
    simple multi_line nested_single_line nested_multi_line two_classes
    inside_text inside_quotes html_comments data_attribute_simple
    data_attribute_multiple erb erb_in_tag multiline_opening_tag
  }

  specs.each do |method_name|
    it "#{method_name}" do
      result = Fira.render(send(method_name))
      res_name = "res_#{method_name}"
      result.should == send(res_name).gsub( /\s+/, " " )
    end
  end

end