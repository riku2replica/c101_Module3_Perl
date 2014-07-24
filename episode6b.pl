#!/usr/bin/perl

# set the content type for the page
print "Content-type: text/html\n\n";

# set the HTML header
print <<EOF;
<HTML>
<HEAD>
<TITLE>Coding 101 Episode 26</TITLE>
</HEAD>
<BODY>
<H1>Coding 101</H1>
<P>This is Example B result...</P>
EOF

$query = $ENV{'QUERY_STRING'};

print "<P><I>Your query string says: $query</I></P>\n";

if (length ($query) > 0){
    @things = split(/&/, $query);
    foreach $thing (@things){
        ($name, $value) = split(/=/, $thing);
        $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
        $in{$name} = $value; 
    }
}

if ($in{'animal'}) {
    $animal = $in{'animal'};
} else {
    $animal = "nothing";
}

if ($in{'name'}) {
    $name = $in{'name'};
} else {
    $name = "unknown";
}

if (($animal =~ /bunny/gi) || ($animal =~ /rabbit/gi)) {
    # If they said anything with "bunny" or "rabbit"...
    print "You said $animal and named it $name!<br />\n";
    print "Yes, bunnies are the best!\n";
} else {
    # If they didn't and are lame...
    print "You said $animal...<br />\n";
    print "Okay, whatever.  I hope $name brings you joy anyway.\n";
}

# end the HTML
print <<EOF;
<P><A HREF="/ep26b.html">Submit again</A></P>
</BODY>
</HTML>
EOF

exit;
