require 'spec_helper'

describe Fira do
  context 'HTML' do

    it 'simple' do
      result = Fira.render simple
      result.should == res_simple
    end

    it 'multi line' do
      result = Fira.render multi_line
      result.should == res_multi_line
    end

    it 'nested single line' do
      result = Fira.render nested_single_line
      result.should == res_nested_single_line
    end

    it 'nested multi line' do
      result = Fira.render nested_multi_line
      result.should == res_nested_multi_line
    end

    it 'two classes' do
      result = Fira.render two_classes
      result.should == res_two_classes
    end

    it 'inside text' do
      result = Fira.render inside_text
      result.should == res_inside_text
    end

    it 'inside quotes' do
      result = Fira.render inside_quotes
      result.should == res_inside_quotes
    end

    it 'comments' do
      result = Fira.render html_comments
      result.should == res_html_comments
    end
  end

  context 'ERB' do
    it 'simple erb' do
      result = Fira.render erb
      result.should == res_erb
    end

    it 'erb in-tag' do
      result = Fira.render erb_in_tag
      result.should == res_erb_in_tag
    end
  end
end