#!/usr/bin/env ruby

def prompt(args)
  print(args)
  gets
end

from = ARGV[0]
to = ARGV[1]

curdir = Dir.pwd
puts
raise ArgumentError.new "Need a from and a to, got from #{from} to #{to}" if from.nil? || to.nil?
puts "Batch renaming via git anything I find with '#{from}' to '#{to}"
results = `find #{curdir} | grep '#{from}'`.split
results.reject!{|dir| dir =~ /\.git/}
raise "Nothing found when grepping for #{from}" if results.empty?
puts
puts "Found #{results.size} files"
puts
results.each do |r|
  new_name = r.gsub(from,to)
  puts "%-90s will become %s" % [r,new_name]
end
puts
puts "Proceed? Y/n: "
input = STDIN.gets.strip


if input == 'Y'
  results.each do |r|
    new_name = r.gsub(from,to)
    cmd = "git mv #{r} #{new_name}"
    `#{cmd}`
    puts "Executing : #{cmd}"
  end
  puts "Finished"
else
  puts "Exiting"
end
puts `git status`
