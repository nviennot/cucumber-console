class CucumberConsole::Runner
  def self.reset(args)
    require 'cucumber'
    require 'cucumber/rspec/disable_option_parser'
    require 'optparse'
    require 'cucumber'
    require 'logger'
    require 'cucumber/parser'
    require 'cucumber/feature_file'
    require 'cucumber/cli/configuration'

    # If we are using RSpec, make sure we load it before, because some step
    # definitions may contain some rspec wizardry.
    ::RSpecConsole::Runner.reset(args) if defined?(::RSpec) && defined?(::RSpecConsole)

    config = ::Cucumber::Cli::Configuration.new
    config.parse!(args)
    ::Cucumber.logger = config.log

    if @runtime
      def config.support_to_load
        begin
          load 'factory_girl/step_definitions.rb' if defined?(FactoryGirl)
        rescue LoadError
        end
        []
      end
      @runtime.configure(config)
    else
      @runtime = ::Cucumber::Runtime.new(config)
    end

    @runtime.instance_eval do
      @loader = nil
      @results = ::Cucumber::Runtime::Results.new(config)
      @support_code.instance_eval do
        @programming_languages.map do |programming_language|
          programming_language.step_definitions.clear
        end
      end
    end
  end

  def self.run(args)
    ::RailsEnvSwitcher.with_env('test', :reload => true) do
      reset(args)
      @runtime.run!
      @runtime.write_stepdefs_json
      @runtime.results.failure?
    end
  end
end
