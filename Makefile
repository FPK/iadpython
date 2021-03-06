SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = docs
BUILDDIR      = docs/_build

check:
	-pyroma -d .
	-check-manifest
	make pylint
	make pep257

pylint:
	-pylint iadpython/iadpython.py
	
pep257:
	-pep257 iadpython/iadpython.py

test:
	nosetests iadpython/test_iadpython.py
	
clean:
	rm -rf dist
	rm -rf iadpython.egg-info
	rm -rf iadpython/__pycache__
	rm -rf .tox

realclean:
	make clean

html:
	$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS)
	
.PHONY: clean realclean test check pylint pep257 html