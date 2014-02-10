.PHONY: all build clean publish start

OUTFILES=output
all: clean build start
build:
	nikola build
clean:
	rm -f .doit.db
	rm -rf cache
	rm -rf $(OUTFILES)
	
	rm -rf __pycache__
	find . -name '*.py[cod]' -type f -delete
	find . -name '*~' -type f -delete
publish: clean build
	ghp-import $(OUTFILES) -b master -p
start:
	nikola serve
