#!/usr/bin/ruby1.9.1
#

require "rubygems"
require "grok-pure"
require "pp"

grok = Grok.new
messages = Array.new

# Load some default patterns that ship with grok.
# See also: 
#   http://code.google.com/p/semicomplete/source/browse/grok/patterns/base
grok.add_patterns_from_file("default.grok")
grok.add_patterns_from_file("common.grok")
grok.add_patterns_from_file("vacation.grok")

messages.push("Nov 30 11:51:01 a.spam.sonic.net vacation-wrap[14341]: qAUJoxHi014339;: exiting with 0: vacation completed")

pattern = "%{VACATION}"
grok.compile(pattern)
grok.compile(pattern)

messages.each do |message|
	match = grok.match(message)
	unless match
		puts 'FAIL: the following message did not match any pattern'
		puts message
	end
#	pp match.captures
end
puts 'All tests complete'
