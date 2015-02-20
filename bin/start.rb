#!/usr/bin/env ruby

require 'socket'


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
  puts "server starting... connect via http://#{Socket.ip_address_list[1].ip_address} when ready"
  exec("puma", "-p", "80")
end

def start_jobs
  exec('sidekiq')
end

def start_other(arg)
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
