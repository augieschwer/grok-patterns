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
grok.add_patterns_from_file("grok-patterns")
grok.add_patterns_from_file("sendmail.grok")

### SENDMAIL_TO ###
messages.push("Nov  7 13:52:47 b.mx.sonic.net sm-mta[29846]: qA7LqlqC029841: to=<augie@corp.sonic.net>, delay=00:00:00, xdelay=00:00:00, mailer=esmtp, pri=121391, relay=lds.sonic.net. [69.12.221.231], dsn=2.0.0, stat=Sent (qA7Lqlbm023338 Message accepted for delivery)")
#
messages.push("Nov 12 13:01:25 b.mail.sonic.net sm-mta[24670]: qACL1HdZ024655: to=<augie@corp.sonic.net>, delay=00:00:08, xdelay=00:00:01, mailer=esmtp, pri=1322505, relay=aspmx.l.google.com. [173.194.79.26], dsn=2.0.0, stat=Sent (OK 1352754085 j9si11007854paw.67)")
#
messages.push("Nov 12 14:40:08 b.mail.sonic.net sm-mta[17605]: qACMe8E2017601: to=<augie@corp.sonic.net>, delay=00:00:00, xdelay=00:00:00, mailer=esmtp, pri=127125, relay=mta6.am0.yahoodns.net., dsn=4.0.0, stat=Deferred")
#
messages.push("Nov 12 16:12:42 b.mail.sonic.net sm-mta[13756]: qAD0Cg5c013756: to=<augie@corp.sonic.net>, delay=00:00:00, pri=30747, stat=Mail Rejected: high volume mailings not allowed. Contact support@sonic.net for more information.")
#
# TODO - input for SENDMAIL_TO with multiple addresses in the "To" field.
messages.push("Nov 13 14:52:10 a.mail.sonic.net sm-mta[16961]: qADMh0cd016570: to=<augie@corp.sonic.net>,<augie@sonic.net>,<augie@schwer.us>, delay=00:09:09, xdelay=00:00:09, mailer=esmtp, pri=4437228, relay=ign-com.mail.eo.outlook.com. [216.32.180.22], dsn=2.0.0, stat=Sent (<00b601cdc1f0$4d506a80$e7f13f80$@com> [InternalId=14475985] Queued mail for delivery)")
#
### SENDMAIL_FROM ###
#
messages.push("Nov  7 13:52:47 b.mx.sonic.net sm-mta[29841]: qA7LqlqC029841: from=<augie@corp.sonic.net>, size=1391, class=0, nrcpts=1, msgid=<509AD829.8000902@corp.sonic.net>, proto=ESMTP, daemon=MTA, relay=a.mail.sonic.net [64.142.16.245]")
#
messages.push("Nov 12 13:01:25 b.mail.sonic.net sm-mta[24787]: qACL1Pfa024787: from=<augie@corp.sonic.net>, size=7712, class=0, nrcpts=1, msgid=<CE31E757C7050D48A2ED38864E85A393014544DA@wlbexch01.wlbutler.com>, proto=ESMTP, daemon=MTA, relay=mail.wlbutler.com [208.106.122.5]")
#
### SENDMAIL_OTHER ###
messages.push("Nov  7 13:52:47 b.mx.sonic.net sm-mta[29841]: qA7LqlqC029841: Milter add: header: X-Sonic-SB-IP-RBLs: IP RBLs sorbs-spam.")

pattern = "%{SENDMAIL}"
grok.compile(pattern)
grok.compile(pattern)

messages.each do |message|
	match = grok.match(message)
	unless match
		puts 'FAIL: the following message did not match any pattern'
		puts message
	end
end
puts 'All tests complete'
