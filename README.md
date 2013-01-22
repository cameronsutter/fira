# Fira

##Description

Fira adds ease-of-use functionality to HTML files. Instead of typing id="foo" or class="foo bar", you can simply type #foo or .foo .bar in HTML tags (in the normal place where you put id or class attributes)

## Installation

Add this line to your application's Gemfile:

    gem 'fira'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fira

## Usage

To use Fira, rename HTML files to .html.fi and rails will automatically handle them.

##Examples

###Id's
&lt;div #my_id &gt;

###Classes
&lt;div .multiple .classes &gt;

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
