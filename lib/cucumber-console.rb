module CucumberConsole
  autoload :Runner,      'cucumber-console/runner'
  autoload :Pry,         'cucumber-console/pry'

  def self.run(*args)
    Runner.run(args)
  end

  Pry.setup if defined?(::Pry)
end
