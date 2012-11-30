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
grok.add_patterns_from_file("dovecot.grok")

# LOGIN
messages.push("Nov 14 09:19:48 d.imapd.sonic.net dovecot: imap-login: Login: user=<augie>, session=h6/hvXfOIQBAjhIX, method=PLAIN, rip=127.0.0.1, lip=127.0.0.1, mpid=30699, secured")
messages.push("Nov 14 14:39:07 d.imapd.sonic.net dovecot: imap-login: Disconnected (auth failed, 1 attempts in 4 secs): user=<augie>, session=r6WPM3zOEwBDoSRN, method=PLAIN, rip=127.0.0.1, lip=127.0.0.1, secured")
messages.push("Nov 14 16:52:22 d.imapd.sonic.net dovecot: imap-login: Aborted login (no auth attempts in 0 secs): user=<>, session=17BcEH7O+ABAjhKC, rip=127.0.0.1, lip=127.0.0.1, TLS")
messages.push("Nov 15 10:02:43 d.imapd.sonic.net dovecot: pop3-login: Login: user=<augie>, session=RjEydYzOewBGJIO7, method=PLAIN, rip=127.0.0.1, lip=127.0.0.1, mpid=28885, secured")
#
# LOGOUT
messages.push("Nov 14 09:43:53 d.imapd.sonic.net dovecot: imap(augie): session=h6/hvXfOIQBAjhIX Disconnected: Logged out in=1970 out=6063")
messages.push("Nov 14 13:55:16 d.imapd.sonic.net dovecot: imap(augie): session=J+iKk3vOmwBMv/+0 Connection closed in=755 out=714148")
messages.push("Nov 14 16:35:00 d.imapd.sonic.net dovecot: imap(augie): session=S2BD0n3OyACu6lan Connection closed in=0 out=315")
messages.push("Nov 14 14:28:14 d.imapd.sonic.net dovecot: imap(augie): session=pfuUoXvO3wDG5N7S Disconnected for inactivity in=159 out=940")
messages.push("Nov 14 14:28:12 d.imapd.sonic.net dovecot: imap(augie): session=nnjBZXrOmwAYKynU Disconnected: Disconnected in IDLE in=854868 out=653461")
messages.push("Nov 15 11:01:23 d.imapd.sonic.net dovecot: pop3(augie): session=ahouI43OYgBI07ev Disconnected for inactivity top=0/0, retr=1/39452, del=0/2968, size=87834658")
messages.push("Nov 15 11:06:22 d.imapd.sonic.net dovecot: pop3(augie): session=pfq6WI3OaQBAjgkE Disconnected: Logged out top=0/0, retr=1/50970, del=1/2, size=16612007")
messages.push("Nov 15 10:02:43 d.imapd.sonic.net dovecot: pop3(augie): session=7oXUdIzO/ABGJLc8 Disconnected: Logged out top=0/0, retr=0/0, del=0/4, size=24880")
#
# OTHER
messages.push("Nov 14 09:19:55 d.imapd.sonic.net dovecot: imap(augie): session=h6/hvXfOIQBAjhIX flag_change: box=INBOX, uid=5999, msgid=<50a2fd7186110_c5b8fdeba98106@3133194401.twitter.com.tmail>, size=6168, from=Twitter <c-nhtvr=fbavp.arg-a2bd3@postmaster.twitter.com>, flags=(\Seen NonJunk)")
messages.push("Nov 14 14:38:47 d.imapd.sonic.net dovecot: imap(augie): session=TehdAHzOPgBFDN3y expunge: box=INBOX.Graymail, uid=231, msgid=<52805BF0F147AC31D2BCDB147796854A-7044bc48ab194dae8373ec9b588cdef8@online.cos..., size=96553, from=Costco News <CostcoNews@online.costco.com>, flags=(\Deleted \Seen)")
messages.push("Nov 14 14:37:07 d.imapd.sonic.net dovecot: imap(augie): session=HO1aJ3zOAABMv/lE flag_change: box=INBOX.Voicemail, uid=32, msgid=, size=745790, from=\"Sonic.net Fusion Voicemail\" <support@sonic.net>, flags=()")
messages.push("Nov 14 16:01:15 d.imapd.sonic.net dovecot: imap(augie): session=HG34VX3ObgBMv/lE mwi-update: expunge: box=INBOX.Voicemail, msgid=, flags=(\Deleted \Seen)")
messages.push("Nov 14 16:20:23 d.imapd.sonic.net dovecot: imap(augie): session=uDP9nX3OAwBMv/lE mwi-update: activity in INBOX.Voicemail folder, sending mwi_update check")
#
# POST-LOGIN
messages.push("Nov 15 14:07:42 d.imapd.sonic.net dovecot-postlogin[26352]: graymail spool missing for augie")
messages.push("Nov 15 14:10:59 d.imapd.sonic.net dovecot-postlogin[2207]: graymail symlink missing for augie to /var/spool/graymail/augie")
messages.push("Nov 15 15:47:59 c.imapd.sonic.net dovecot-postlogin[2643]: graymail symlink for augie added")
messages.push("Nov 15 15:47:59 c.imapd.sonic.net dovecot-postlogin[2643]: graymail directory exist /var/spool/graymail/augie")
messages.push("Nov 28 02:45:28 b.imapd.sonic.net dovecot-postlogin[7524]: graymail symlink creation failure for augie :: File exists")
#
# STATS
messages.push("Nov 15 14:18:36 d.imapd.sonic.net dovecot: stats: Error: Mail server input error: UPDATE-SESSION: stats shrank: mlpath 2 < 3")
messages.push("Nov 15 14:00:36 d.imapd.sonic.net dovecot: stats: Warning: UPDATE-CMD: Already expired")
messages.push("Nov 15 13:49:33 d.imapd.sonic.net dovecot: stats: Warning: Session 17d72e12b557a550934b000087030a5d (user augie, service imap) appears to have crashed, disconnecting it")
messages.push("Nov 15 13:50:33 d.imapd.sonic.net dovecot: stats: Warning: Couldn't find session GUID: 17d72e12b557a550934b000087030a5d")
#
# AUTH
messages.push("Nov 15 11:19:24 d.imapd.sonic.net dovecot: auth-worker(23487): pam(augie,127.0.0.1): unknown user")
messages.push("Nov 15 11:19:11 d.imapd.sonic.net dovecot: auth: passdb(_mwi-master,127.0.0.1,master,<qR6mho3OtgBMv/lE>): Master user logging in as augie")
messages.push("Nov 15 16:00:55 c.imapd.sonic.net dovecot: auth: plain(?,127.0.0.1,<fGC5dZHOxwBFDN3x>): Empty username")
# SSL
messages.push("Nov 16 13:45:43 a.imapd.sonic.net dovecot: ssl-params: SSL parameters regeneration completed")

pattern = "%{DOVECOT}"
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
