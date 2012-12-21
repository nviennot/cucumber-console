module CucumberConsole::Pry
  def self.setup
    ::Pry::CommandSet.new do
      create_command "cucumber", "Works pretty much like the regular cucumber command" do
        group "Testing"
        def process(*args)
          CucumberConsole::Runner.run(args)
        end
      end
    end.tap { |cmd| ::Pry::Commands.import cmd }
  end
end
