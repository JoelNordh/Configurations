(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; Spaces instead of tabs;
(setq-default indent-tabs-mode nil)

;; No BackupFiles
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(load-file "~/.emacs.d/cedet/cedet-devel-load.el") ;; your cedet.el load path

;; Enable EDE (Project Management) features
(global-ede-mode 1)
(semantic-load-enable-excessive-code-helpers)      ; Enable prototype help and smart completion 
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;; Semantic
(global-semantic-idle-scheduler-mode)
(global-semantic-idle-completions-mode)
(global-semantic-decoration-mode)
(global-semantic-highlight-func-mode)
;; (global-semantic-show-unmatched-syntax-mode)

;; CC-mode
(add-hook 'c-mode-common-hook '(lambda ()
        (setq ac-sources (append '(ac-source-semantic) ac-sources))
))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (expand-file-name
             "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict"))
(setq ac-comphist-file (expand-file-name
             "~/.emacs.d/ac-comphist.dat"))
(ac-config-default)

(setq tramp-copy-size-limit nil)

(set-variable 'ac-delay 0.5)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(ede-project-directories
   (quote
    ("/home/joel/work/proto-test/liveValues/output/clientSocketIo/include" "/home/joel/work/proto-test/liveValues/output/clientSocketIo/src" "/home/joel/work/proto-test/liveValues/output/clientSocketIo" "/home/joel/work/yocto/wexiodisk/meta-application/recipes-application/webtoolLiveValues/files/test" "/home/joel/work/yocto/wexiodisk/meta-application/recipes-application/webtoolLiveValues/files/include" "/home/joel/work/yocto/wexiodisk/meta-application/recipes-application/webtoolLiveValues/files/src" "/home/joel/work/yocto/wexiodisk/meta-application/recipes-application/webtoolLiveValues/files" "/tmp/proj/include" "/tmp/proj/src" "/tmp/proj" "/home/joel/work/dbus/first/test/include" "/home/joel/work/dbus/first/test/src" "/home/joel/work/dbus/first/test" "/home/joel/work/dbus/first/server")))
 '(inhibit-startup-screen t)
 '(semantic-c-dependency-system-include-path
   (quote
    ("/usr/include/dbus-cxx-0.8" "/usr/local/include/dbus-cxx-0.8"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; own keyboard shortcuts
(global-set-key (kbd "C-c j") 'semantic-ia-fast-jump)
(global-set-key (kbd "C-c g") 'semantic-symref)
(global-set-key (kbd "C-c i") 'indent-region)

(add-to-list 'load-path "/home/joel/share/emacs/site-lisp/")
(require 'git)
