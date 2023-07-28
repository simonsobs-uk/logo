SO-EPS = $(wildcard SO/*.eps)
SO-SVG = $(patsubst %.eps,%.svg,$(SO-EPS))

.PHONY: all clean
all: $(SO-SVG) index.html
clean:
	rm -f $(SO-SVG) index.html

index.html: README.md
	pandoc -s -o index.html README.md

%.svg: %.eps
	inkscape $< --export-filename=$@

print-%:
	$(info $* = $($*))
