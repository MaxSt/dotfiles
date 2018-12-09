clean:
	@rm -f init.elc early-init.elc config.el config.elc

compile: early-init.el init.el config.org clean
	@emacs -Q --batch -l 'lisp/compile.el'
