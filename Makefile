TYPICAL=139 163 aol foxmail gmail googlemail hotmail kimo outlook qq rocketmail yahoo yandex yeah ymail gmx

freemail: single workmail mailcom onet $(TYPICAL)
	grep -h . out/* | sort -u > freemail.txt
	git diff freemail.txt out

single:
	scripts/single > out/single

workmail:
	scripts/workmail > out/workmail

mailcom:
	scripts/mailcom > out/mailcom

onet:
	scripts/onet > out/onet

$(TYPICAL):
	scripts/typical $@ > out/$@
