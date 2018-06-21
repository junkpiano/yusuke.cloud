require 'dotenv/tasks'
require 'jekyll'
require 'html-proofer'

task :build do
  config = Jekyll.configuration({ 
    'source' => './',
    'destination' => './_site'
  })
  site = Jekyll::Site.new(config)
  puts 'Building site...'.bold
  Jekyll::Commands::Build.build site, config
end

task :lint do
  Rake::Task['build'].invoke
  options = { :assume_extension => true, :disable_external => true }
  HTMLProofer.check_directory("./_site", options).run  
end