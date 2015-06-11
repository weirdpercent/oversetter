$:.unshift File.dirname(__FILE__)
require 'rake/clean'
require 'bundler/version'
require 'lib/oversetter/version'

desc 'Run Spinach'
task :spinach do
  system 'spinach --reporter progress'
end

desc 'Build gemspec'
task :build do
	`gem build oversetter.gemspec`
  if $?.exitstatus == 0
		puts "Built oversetter-#{Oversetter::VERSION}.gem."
  else
    puts 'Failed to build gemspec.'
  end
end

desc 'Install gem'
task :install do
	`gem install oversetter-#{Oversetter::VERSION}.gem`
  if $?.exitstatus == 0
    puts "Installed oversetter-#{Oversetter::VERSION}.gem."
  else
    puts 'Failed to install gem file.'
  end
end

desc 'Create executable in /bin'
task :bin do
  `cp ./lib/oversetter.rb ./bin/oversetter`
  puts 'Built binstub.'
end

namespace :oversetter do
  desc 'gltr[searchword]'
  task :gltr, :search do |t, args|
    search = args.search
		system "oversetter gl tr --src=eng --tar=spa #{search}"
  end
	desc 'glex[searchword]'
	task :glex, :search do |t, args|
    search = args.search
		system "oversetter gl ex --esrc=eng --etar=spa #{search}"
  end
  desc 'hatr[searchword]'
  task :hatr, :search do |t, args|
    search = args.search
		system "oversetter ha tr --src=eng --tar=spa #{search}"
  end
	desc 'haex[searchword]'
	task :haex, :search do |t, args|
    search = args.search
		system "oversetter ha ex --esrc=eng --etar=spa #{search}"
  end
  desc 'hali[searchword]'
  task :hali, :search do |t, args|
    search = args.search
		system "oversetter ha li #{search}"
  end
  desc 'hasi[searchword]'
  task :hasi, :search do |t, args|
    search = args.search
		system "oversetter ha si --ssrc=eng --star=spa #{search}"
  end
  desc 'yatr[searchword]'
  task :yatr, :search do |t, args|
    search = args.search
		system "oversetter ya tr --lang=en-es #{search}"
  end
  desc 'yali[searchword]'
  task :yali, :search do |t, args|
    search = args.search
		system "oversetter ya li --ui=en #{search}"
  end
end

task :travis do
	['rake spinach', 'rake oversetter:gltr[hello]', 'rake oversetter:glex[hello]',
		'rake oversetter:hatr[hello]', 'rake oversetter:haex[hello]',
		'rake oversetter:hali[hello]', 'rake oversetter:hasi[hello]', 'rake oversetter:yatr[hello]',
		'rake oversetter:yali[hello]'].each do |cmd|
    puts "Starting to run #{cmd}..."
    `bundle exec #{cmd}`
    raise "#{cmd} failed!" unless $?.exitstatus == 0
  end
end

task :default => ':travis'
