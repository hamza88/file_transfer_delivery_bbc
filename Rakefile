require 'rubygems'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end


sys_config = YAML.load_file('./features/config/config.yml')



