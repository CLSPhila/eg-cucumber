require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

task default: [:features]

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty --format html -o docs/index.html"
end
