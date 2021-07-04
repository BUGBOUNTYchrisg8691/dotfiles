;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Chris Girvin"
      user-mail-address "chrisg8691@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 16 :style "Medium Oblique")
      doom-big-font (font-spec :family "Iosevka Nerd Font" :size 24 :style "Heavy Oblique")
      doom-variable-pitch-font (font-spec :family "Overpass Nerd Font" :size 16 )
      doom-unicode-font (font-spec :family "JulaMono")
      doom-serif-font (font-spec :family "BlexMono Nerd Font" :weight 'light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;(setq org-directory "~/org/")         ;; moved to `after!` section

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")

(require 'centaur-tabs)
(centaur-tabs-mode t)

(setq centaur-tabs-set-bar 'over
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "slant"
      centaur-tabs-modified-marker "")

(map! :leader
      :desc "Toggle tabs globally" "t C" #'centaur-tabs-mode
      :desc "Toggle tabs local display" "t c" #'centaur-tabs-local-mode )
;; (evil-define-key 'normal centaur-tabs-mode-map (kbd "g l") 'centaur-tabs-forward        ; default Doom binding is 'g t'
;;                                                (kbd "g h") 'centaur-tabs-backward       ; default Doom binding is 'g T'
;;                                                (kbd "g j") 'centaur-tabs-foreward-group
;;                                                (kbd "g k") 'centaur-tabs-backward-group)

(add-hook 'after-init-hook 'global-company-mode)
(use-package! company
  ;;(company-idle-delay 0.3) ;; how long to wait until popup
  :bind
  (:map company-active-map
	      ("C-n". company-select-next)
	      ("C-p". company-select-previous)
	      ("M-<". company-select-first)
	      ("M->". company-select-last)))

;; tabnine backend
(add-to-list 'company-backends #'company-tabnine )

;; recommended
;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; workaround for company-transformers
(setq company-tabnine--disable-next-transform nil)
(defun my-company--transform-candidates (func &rest args)
  (if (not company-tabnine--disable-next-transform)
      (apply func args)
      (setq company-tabnine--disable-next-transform nil)
      (car args)))

(defun my-company-tabnine (func &rest args)
  (when (eq (car args) 'candidates)
    (setq company-tabnine--disable-next-transform t))
  (apply func args))

(advice-add #'company--transform-candidates :around #'my-company--transform-candidates )
(advice-add #'company-tabnine :around #'my-company-tabnine )

;; set default `company-backends'
(setq company-backends
      '((company-files          ; files & directory
         company-keywords       ; keywords
         company-capf
         company-yasnippet
         )
        (company-abbrev company-dabbrev)
        ))

(add-hook 'python-mode-hook
          (lambda ()
            (add-to-list (make-local-variable 'company-backends)
                         'company-anaconda)))
(dolist (hook '(js-mode-hook
                js2-mode-hook
                js3-mode-hook
                inferior-js-mode-hook
                ))
  (add-hook hook
            (lambda ()
              (tern-mode t)

              (add-to-list (make-local-variable 'company-backends)
                           'company-tern)
              )))

;;;_. company-mode support like auto-complete in web-mode

;; Enable CSS completion between <style>...</style>
(defadvice company-css (before web-mode-set-up-ac-sources activate)
  "Set CSS completion based on current language before running `company-css'."
  (if (equal major-mode 'web-mode)
      (let ((web-mode-cur-language (web-mode-language-at-pos)))
        (if (string= web-mode-cur-language "css")
            (unless css-mode (css-mode))))))

;; Enable JavaScript completion between <script>...</script> etc.
(defadvice company-tern (before web-mode-set-up-ac-sources activate)
  "Set `tern-mode' based on current language before running `company-tern'."
  (if (equal major-mode 'web-mode)
      (let ((web-mode-cur-language (web-mode-language-at-pos)))
        (if (or (string= web-mode-cur-language "javascript")
               (string= web-mode-cur-language "jsx"))
            (unless tern-mode (tern-mode))
          ;; (if tern-mode (tern-mode))
          ))))

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

;; previews
(setq +ivy-buffer-preview t)

(use-package yasnippet
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(use-package flycheck)

;; after org-mode loads
(after! 'org
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/Org/"
        org-agenda-files '("~/Org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-hide-emphasis-markers t)
  (org-babel-do-load-languages 'org-babel-load-languages
                               (append org-babel-load-languages
                                       '(('awk             . t)
                                         ('browser         . t)
                                         ('C               . t)
                                         ('C++             . t)
                                         ('csharp          . t)
                                         ('css             . t)
                                         ('haskell         . t)
                                         ('http            . t)
                                         ('java            . t)
                                         ('js              . t)
                                         ('kotlin          . t)
                                         ('lisp            . t)
                                         ('lua             . t)
                                         ('make            . t)
                                         ('mongo           . t)
                                         ('org             . t)
                                         ;;(php             . t)  ; not currently supported?
                                         ('python          . t)
                                         ('R               . t)
                                         ('ruby            . t)
                                         ('sass            . t)
                                         ('sed             . t)
                                         ('shell           . t)
                                         ('sql             . t)
                                         ('sqlite          . t)
                                         ('typescript      . t)))))

;; (custom-set-faces
;;   '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
;;   '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
;;   '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
;;   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
;;   '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))



(use-package mu4e
  ;;:load-path "/usr/share/emacs/site-lisp/mu4e"
  :defer 20
  :config
  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)
  ;; Refresh mail using mbsync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Mail")

  ;; set message-send-mail-function to use email providers smtp service through smtpmail package
  (setq message-send-mail-function 'smtpmail-send-it)

  ;; multiple accounts (contexts)
  (setq mu4e-contexts
        (list
         ;; create chrisg8691-gmail account context
         (make-mu4e-context
          :name "achrisg8691-gmail"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/chrisg8691-gmail" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address            . "chrisg8691@gmail.com")
                  (user-full-name               . "Chris Girvin")
                  (smtpmail-smtp-server         . "smtp.gmail.com")
                  (smtpmail-smtp-service        . 465)
                  (smtpmail-stream-type         . ssl)
                  (mu4e-drafts-folder           . "/chrisg8691-gmail/[Gmail].Drafts")
                  (mu4e-sent-folder             . "/chrisg8691-gmail/[Gmail].Sent Mail")
                  (mu4e-refile-folder           . "/chrisg8691-gmail/[Gmail].All Mail")
                  (mu4e-trash-folder            . "/chrisg8691-gmail/[Gmail].Trash")))

         ;; create bugbounty.chrisg8691-gmail account context
         (make-mu4e-context
          :name "bbugbounty.chrisg8691-gmail"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/bugbounty.chrisg8691-gmail" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address            . "bugbounty.chrisg8691@gmail.com")
                  (user-full-name               . "Chris Girvin")
                  (smtpmail-smtp-server         . "smtp.gmail.com")
                  (smtpmail-smtp-service        . 465)
                  (smtpmail-stream-type         . ssl)
                  (mu4e-drafts-folder           . "/bugbounty.chrisg8691-gmail/[Gmail].Drafts")
                  (mu4e-sent-folder             . "/bugbounty.chrisg8691-gmail/[Gmail].Sent Mail")
                  (mu4e-refile-folder           . "/bugbounty.chrisg8691-gmail/[Gmail].All Mail")
                  (mu4e-trash-folder            . "/bugbounty.chrisg8691-gmail/[Gmail].Trash")))

         ;; create chrisg8691-outlook account context
         (make-mu4e-context
          :name "cchrisg8691-outlook"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/chrisg8691-outlook" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address            . "chrisg8691@outlook.com")
                  (user-full-name               . "Chris Girvin")
                  (smtpmail-smtp-server         . "smtp.office365.com")
                  (smtpmail-smtp-service        . 587)
                  (smtpmail-stream-type         . starttls)
                  (mu4e-drafts-folder           . "/chrisg8691-outlook/Drafts")
                  (mu4e-refile-folder           . "/chrisg8691-outlook/Archive")
                  (mu4e-trash-folder            . "/chrisg8691-outlook/Deleted")))

         ;; create bugbounty.chrisg8691-outlook account context
         (make-mu4e-context
          :name "dbugbounty.chrisg8691-outlook"
          :match-func
            (lambda (msg)
              (when msg
                (string-prefix-p "/bugbounty.chrisg8691-outlook" (mu4e-message-field msg :maildir))))
          :vars '((user-mail-address            . "bugbounty.chrisg8691@outlook.com")
                  (user-full-name               . "Chris Girvin")
                  (smtpmail-smtp-server         . "smtp.office365.com")
                  (smtpmail-smtp-service        . 587)
                  (smtpmail-stream-type         . starttls)
                  (mu4e-drafts-folder           . "/bugbounty.chrisg8691-outlook/Drafts")
                  (mu4e-refile-folder           . "/bugbounty.chrisg8691-outlook/Archive")
                  (mu4e-trash-folder            . "/bugbounty.chrisg8691-outlook/Deleted")))))

  ;; shortcuts for main acct
  (setq mu4e-maildir-shortcuts
        '(("/chrisg8691-gmail/Inbox"                    . ?i)
          ("/bugbounty.chrisg8691-gmail/Inbox"          . ?1)
          ("/chrisg8691-outlook/Inbox"                  . ?2)
          ("/bugbounty.chrisg8691-outlook/Inbox"        . ?3)
          ("/chrisg8691-gmail/[Gmail].Sent Mail"        . ?s)
          ("/chrisg8691-gmail/[Gmail].Trash"            . ?t)
          ("/chrisg8691-gmail/[Gmail].Drafts"           . ?d)
          ("/chrisg8691-gmail/[Gmail].All Mail"         . ?a)))

  ;; set context policies
  ;; (setq mu4e-compose-context-policy 'ask)
  ;; (setq mu4e-context-policy "chrisg8691-gmail")

  ;; run mu4e in the background
  (mu4e t))

;; distrotube config need to look into this more
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
;;(require 'smtpmail)
;; I have my mbsyncrc in a different folder on my system, to keep it separate from the
;; mbsyncrc available publicly in my dotfiles. You MUST edit the following line.
;; Be sure that the following command is: "mbsync -c ~/.config/mu4e/mbsyncrc -a"
;; (setq mu4e-get-mail-command "mbsync -c ~/.config/mu4e/mbsyncrc -a"
;;       mu4e-update-interval  300
;;       mu4e-main-buffer-hide-personal-addresses t
;;       message-send-mail-function 'smtpmail-send-it
;;       starttls-use-gnutls t
;;       smtpmail-starttls-credentials '(("smtp.1and1.com" 587 nil nil))
;;       mu4e-sent-folder "/account-1/Sent"
;;       mu4e-drafts-folder "/account-1/Drafts"
;;       mu4e-trash-folder "/account-1/Trash"
;;       mu4e-maildir-shortcuts
;;       '(("/account-1/Inbox"      . ?i)
;;         ("/account-1/Sent Items" . ?s)
;;         ("/account-1/Drafts"     . ?d)
;;         ("/account-1/Trash"      . ?t)))

(use-package emojify
  :hook (general-after-init . global-emojify-mode))

(defun efs/lookup-password (&rest keys)
  (let ((result (apply #'auth-source-search keys)))
    (if result
        (funcall (plist-get (car result) :secret))
      nil)))
