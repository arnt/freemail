# Listing free mail providers

This is a fairly long list of free email domains.

It's not complete, but if a Nigerian cyberentrepreneur has heard of a
particular free email service, then that service's domains are probably
listed here. I use it as a list of domains whose users probably don't know
each other, which is useful if you want to estimate a social graph. My
estimate does not need to be 100% correct, so I'm not trying for 100%
correctness in this list.

To regenerate the list, just run ```make -j20``` and wait for freemail.txt
to be updated. Higher parallelism can make the local DNS server time out,
and a timeout silently drops a domain from the list.

## Technical overview

There's a Makefile that runs a number of small shell scripts in parallel.
Each shell script requires almost no CPU or RAM, but causes quite some load
on the local DNS server. There are (at present) five different scripts,
each with its own mechanism for discovering free email services.

This uses a Makefile because Make is good at running a DAG of small
scripts, which is exactly what this needs.

## Pull requests welcome

To add a new service:

 - Add it to the ```typicals``` list if it operates a .com domain and
   eponymous other domains using the same name or mail servers (as e.g.
   Microsoft does for hotmail.com, hotmail.fi etc). The candidates are
   the TLDs in cctlds, the second-level suffixes in slds and the suffixes
   already in freemail.txt. If its main domain is not a
  .com, add the main domain to freemail.txt as well, as
  [the commit for gmx.de](https://github.com/arnt/freemail/commit/9c0ac6621cd91ab86a4df80a19a8ac00cff8f912)
  shows, and rerun make.

 - Write a custom script to download its signup form and list the
   domains if it has many (as e.g. mail.com does).

 - Add its main domain to the scripts/legacy line in the Makefile if it
   no longer accepts new signups for some of its domains, or no longer
   lists them on its signup form. scripts/legacy keeps every domain in
   freemail.txt that shares an MX with one of the domains on that line
   (as e.g. the older mail.com and webmail.co.za domains do).

 - Add it to scripts/single if it's just a single domain (as mail.ru).

 - Do something else.

This never needs to run without adult supervision, so I haven't tried to
make the scripts either robust or fast. If you want to write a prettier or
faster script, or use a different language, you're welcome.
