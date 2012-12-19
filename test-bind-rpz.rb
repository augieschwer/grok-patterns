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
grok.add_patterns_from_file("bind-rpz.grok")

#messages.push("19-Dec-2012 09:25:23.930 rpz: info: client 127.0.0.1#57492: disabled rpz QNAME NXDOMAIN rewrite example.com via example.com.rpz.spamhaus.org")
IO.foreach("/home/augie/Devel/rpz-testing/rpz.log.2") { |line| messages.push(line) }

pattern = "%{BINDRPZ}"
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
