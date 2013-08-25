require "bundler/gem_tasks"

task :default => :publish

task :clean do
  system 'rm *.gem'
  system 'rm -fr pkg'
end

task :build => :clean do
  system 'gem build *.gemspec'
end

task :publish => :build do
  system 'gem push *.gem'
end
