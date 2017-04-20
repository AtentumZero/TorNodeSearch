tornodesearch

A basic shell script to check if an IP address is listed as a Tor node (exit or relay)
on the Tor DNS (IP-based) blacklists operated by dan.me.uk

Example command: ./tornodesearch.sh 192.168.0.2

Blank results will be listed as --- ---

If your search has a result other than those dashes then it is listed. The results should display information on the listing and whether it is a Tor node or exit relay.

Compatible with POSIX systems - Linux, BSD, Solaris etc.
