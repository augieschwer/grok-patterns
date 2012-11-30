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
grok.add_patterns_from_file("graymail.grok")

messages.push("Nov 29 15:14:20 a.spam.sonic.net graymail: augie sent <0.0.1079908368.spx405e1810hss392.0@whenimawalkin.com> \"Truck\" <contact@whenimawalkin.com> to graymail")
messages.push("Nov 30 11:32:48 a.spam.sonic.net graymail: augie sent <0.1.A6.CE8.1CDCF3176314704.0@vmta-c-103.listrak.com> \"The Home Decorating Company\" <enews@home-decorating-co.com> to /dev/null for SpamAssassin Blacklists")

pattern = "%{GRAYMAIL}"
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
