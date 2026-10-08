TYPICAL=139 163 aol foxmail gmail googlemail hotmail kimo live outlook qq rocketmail yahoo yandex yeah ymail gmx

freemail: single legacy mailcom onet $(TYPICAL)
	grep -h . out/* | sort -u > freemail.txt
	git diff freemail.txt out

single:
	scripts/single > out/single

legacy:
	scripts/legacy mail.com webmail.co.za > out/legacy

mailcom:
	scripts/mailcom > out/mailcom

onet:
	scripts/onet > out/onet

$(TYPICAL):
	scripts/typical $@ > out/$@
