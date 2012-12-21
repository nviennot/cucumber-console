Cucumber Console
=============

Cucumber Console allows you to run your Cucumber tests in a Rails console.
Best served chilled with [irb-config](https://github.com/nviennot/irb-config).

### Watch the screencast

[![Watch the screencast!](https://s3.amazonaws.com/velvetpulse/screencasts/irb-config-screencast.jpg)](http://velvetpulse.com/2012/11/19/improve-your-ruby-workflow-by-integrating-vim-tmux-pry/)

Usage
------

Install it with:

```ruby
gem 'cucumber-console'
```

If you have [Pry](https://github.com/pry/pry) installed, you will have access to the `cucumber` command
in your console, which works exactly like the shell command line cucumber one.


```
pafy@bisou ~/prj/pleasehalp [master●] % rails c
Loading development environment (Rails 3.2.9)
~/prj/pleasehalp (development) > cucumber --format=pretty features/questions.feature:8
Using the default profile...
Feature: User asks a question

@javascript
Scenario: User asks a question                                 # features/questions.feature:4
Given I am on the homepage                                     # features/step_definitions/web_steps.rb:50
When I fill in the question field with "What time is it?"      # features/step_definitions/question.rb:1
And I press "Ask"                                              # features/step_definitions/web_steps.rb:58
Then the "question_text" field within the page should equal "" # features/step_definitions/web_steps.rb:145
And I should see a question "What time is it?"                 # features/step_definitions/question.rb:5

1 scenario (1 passed)
5 steps (5 passed)
0m1.036s

~/prj/crowdtap/sniper (development) >
```

If you don't have pry, you can use:

```ruby
CucumberConsole.run '--format=pretty', 'features/questions.feature:8'
```

TODO
----

* Testing

License
-------

MIT License
