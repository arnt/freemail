TYPICAL=139 aol foxmail gmail googlemail hotmail kimo onet outlook qq rocketmail yahoo yandex yeah ymail gmx

freemail: single terra workmail mailcom $(TYPICAL)
	grep -h . out/* | sort -u > freemail.txt
	git diff freemail.txt out

single:
	scripts/single > out/single

terra:
	scripts/terra > out/terra

workmail:
	scripts/workmail > out/workmail

mailcom:
	scripts/mailcom > out/mailcom

$(TYPICAL):
	scripts/typical $@ > out/$@
