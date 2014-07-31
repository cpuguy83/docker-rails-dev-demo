#!/usr/bin/env ruby

def start_selector(arg)
  case arg
  when 'jobs'
    start_jobs
  when 'server'
    start_server
  when 'test'
    run_tests
  else
    start_other(arg)
  end
end

def start_server
  exec('unicorn_rails')
end

def start_jobs
  exec('sidekiq')
end

def start_other(arg)
  puts "Unknown argument used, starting in shell: #{arg}"
  exec(arg)
end

def run_tests
  exec("RAILS_ENV=test rake test")
end

case ARGV.count
when 0
  start_server
when 1
  start_selector(ARGV[0])
else
  start_other(ARGV)
end
