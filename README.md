# Fira

##Description

Fira adds ease-of-use functionality to HTML files. 

Instead of typing id="foo" or class="foo bar", you can simply type #foo or .foo .bar in HTML tags (in the normal place where you put id or class attributes)

## Installation

Add this line to your application's Gemfile:

    gem 'fira'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fira

## Usage

To use Fira, rename HTML files to .html.fira and rails will automatically handle them. It will even evaluate embedded ruby code using Erubis. (note: Erubis runs after Fira)

Once in your Gemfile, Fira will be the default template_engine for <code>rails generate</code>, which means that view files that are normally .html.erb will now be .html.fira files.

##Examples

###Id's
&lt;div #my_id &gt; becomes &lt;div id="my_id" &gt;

###Classes
&lt;div .multiple .classes &gt; becomes &lt;div class='multiple classes' &gt;

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
