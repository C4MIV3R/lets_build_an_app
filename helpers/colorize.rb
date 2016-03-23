#colourize written by code-for-coffee
#james@codeforcoffee.org
#usage: c = Colourize.new
#c.log(:colour, output_variable)
#valid colours:
#:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, :aqua, :silver, :aliceblue, :indianred
class Colorize
  require 'rainbow'
  def initialize
    @valid_colours = [:black, :red, :green, :yellow, :blue, :magenta, :cyan, :white, :aqua, :silver, :aliceblue, :indianred]
  end

  def log(color, data)
    puts Rainbow(data.to_s).send(color)
  end
end
