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

task deploy: :dotenv do
  branch = ENV['TRAVIS_BRANCH']
  remote_ip = ENV['STAGING_IP']
  remote_host = ENV['STAGING_HOST']

  if branch == 'master'
    remote_ip = ENV['PRODUCTION_IP']
    remote_host = ENV['PRODUCTION_HOST']    
  end

  sh 'rsync -avuze "ssh -i ~/.ssh/linode" --delete _site yusuke-bot@#{remote_ip}:~/'
  sh 'ssh -ti ~/.ssh/linode yusuke-bot@#{remote_ip} "sudo rsync -avuz --delete _site/* /var/www/#{remote_host}/ && rm -rf _site"'
end