clean:
	@rm -f init.elc config.el config.elc

compile: init.el config.org clean
	@emacs -Q --batch -l 'lisp/compile.el'
