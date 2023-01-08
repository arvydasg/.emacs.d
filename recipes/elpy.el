;;; elpy.el --- elpy stuff
;;; Commentary:
;; Elpy
;; [2022-02-20 Sk] TUT: "Elpy" - various python modes for easier python
;; programming. Installs various other packages as well.  A few videos to
;; help install elpy and
;; customize.

;; https://www.youtube.com/watch?v=0kuCeS-mfyc,
;; https://www.youtube.com/watch?v=mflvdXKyA_g
;; https://elpy.readthedocs.io/en/latest/index.html
;; When using tab auto completion, click f1 and get the explanation in
;; another buffer. Company doccumentation window.  and of course more
;; amazing [[https://gist.github.com/mahyaret/a64d209d482fc0f5eca707f12ccce146][shortcuts]] Here.

;; if documentation suggestions get annoyin - turn off eldoc mode

;; INSTALL:
;; 1. sudo pip install elpy rope jedi
;; 1. add export PATH=$PATH:~/.local/bin to your .bashrc file and reload
;;    Emacs.
;; 2. should get a message asking something about RPC, click yes.
;; 3. then make sure jedi is installed in your system. others use flake8,
;;    others use jedi.. idk. zamansky and the guy from he tutorial video
;;    use jedi.
;; 4. do M-x elpy-config to see the config
;; 5. check your .emacs.d folder. if there is one called "elpy" and it is
;;    empty or something, do M-x elpy-rpc-restart. Folders will appear,
;;    packages will install. Then do elpy-config
;; 6. pip install flake8 - get to see more syntax checks. M-x elpy-config
;;    to confirm its installed
;;; Code:

(use-package elpy
  :ensure t
  :custom (elpy-rpc-backend "jedi")
  :init
  (elpy-enable))
;; :bind (("M-." . elpy-goto-definition)))
(setq elpy-rpc-virtualenv-path 'current)
(set-language-environment "UTF-8")

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(setq elpy-get-info-from-shell t)

;; <2022-03-18 Pn> Turned it off, doesn't look nice
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

;; tired of "Can't guess python-indent-offset, using defaults 4" message
;; https://stackoverflow.com/questions/18778894/emacs-24-3-python-cant-guess-python-indent-offset-using-defaults-4
(setq python-indent-guess-indent-offset-verbose nil)

;;; elpy.el ends here
