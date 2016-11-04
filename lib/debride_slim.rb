require 'debride'
require 'slim'

class Debride
  module Slim
    VERSION = '1.0.0'
  end

  def process_slim file
    ruby = ::Slim::Template.new(file).instance_variable_get('@src')

    begin
      RubyParser.new.process ruby, file
    rescue => e
      warn ruby if option[:verbose]
      raise e
    end
  end
end
