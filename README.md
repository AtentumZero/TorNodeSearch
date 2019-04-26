# TorNodeSearch

A basic shell script to check if an IP address is listed as a Tor node (exit or relay)
on the Tor DNS (IP-based) blacklists operated by dan.me.uk.

Other than an active Internet connection and Bash or a bash compatible-shell installed, there are no other requirements for TorNodeCheck to run.

If your search has a result other than those dashes then it is listed. The results should display information on the listing and whether it is a Tor node or exit relay. Blank results will be listed as --- ---
