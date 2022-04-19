#!/usr/bin/env ruby

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))

require 'discogs'

while TRUE
  puts 'Write a phrase(e.g: overkill ironbound)'
  phrase = gets.chomp
  DiscogsApp.new(phrase).run
end
