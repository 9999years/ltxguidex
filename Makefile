PACKAGE := ltxguidex
DIST_FILES := ${PACKAGE}.cls ${PACKAGE}.tex ${PACKAGE}.pdf \
	README.md LICENSE.txt
TEXMF_ROOT := ${HOME}/texmf
INSTALL_DIR := $(TEXMF_ROOT)/tex/latex/${PACKAGE}
LATEXMK = latexmk -aux-directory=extra -pdf -r ./.latexmkrc -pvc- -pv-

${PACKAGE}.pdf: ${PACKAGE}.tex
	$(LATEXMK) $?

example.pdf: example.tex
	$(LATEXMK) $?

${PACKAGE}: $(DIST_FILES)
	mkdir -p ${PACKAGE}
	cp -t ${PACKAGE} $?
	chmod -x,+r ${PACKAGE}/*

${PACKAGE}.tar.gz: ${PACKAGE}
	tar -czf $@ $?
	tar -tvf $@

dist: ${PACKAGE}.tar.gz

tidy:
	# all generated files but the pdf
	$(LATEXMK) -c
	rm -rf extra
	# copied files
	rm -rf ${PACKAGE}

clean:
	$(LATEXMK) -C
	make tidy
	rm -f ${PACKAGE}.tar.gz

install: ${PACKAGE}
	install -d ${INSTALL_DIR}
	install $(DIST_FILES) ${INSTALL_DIR}
