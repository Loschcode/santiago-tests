Dir.glob("./app/lib/**/*.rb") {|f| require f}

require './app/ruby_exercises'

RubyExercise.new.run