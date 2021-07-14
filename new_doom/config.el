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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;;(setq display-line-numbers-type 'relative)

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

(setq x-super-keysym 'meta)                     ; set 'super' key as 'meta'

(setq auth-sources '("~/.authinfo.gpg")         ; use "~/.authinfo.gpg" instead of default location
      auth-source-cache-expiry nil)             ; auth sources queries never expire

(setq-default
 delete-by-moving-to-trash t                    ; delete files to trash
 window-combination-resize t                    ; take new window space from all splits, not just current
 x-stretch-cursor t)                            ; stretch cursor to the glyph width

(setq undo-limit 80000000                       ; set undo limit to 80 Mb
      evil-want-fine-undo t                     ; granular changes in insert mode
      auto-save-default t                       ; enable autosaving
      truncate-string-ellipsis "…"              ; save space on "..."
      password-cache-expiry nil                 ; save passwords
      scroll-preserve-screen-position 'always   ; save cursor position
      scroll-margin 2)                          ; set scroll margin

(display-time-mode 1)                           ; display time in modeline

(display-battery-mode 1)                     ; display battery percentage in modeline

(global-subword-mode 1)                         ; iterate through camelCase words

(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

(setq +ivy-buffer-preview t)

(map! :map evil-window-map
      "SPC"             #'rotate-layout
      ;; navigation
      "<left>"          #'evil-window-left
      "<down>"          #'evil-window-down
      "<up>"            #'evil-window-up
      "<right>"         #'evil-window-right
      ;; swapping windows
      "C-<left>"        #'+evil/window-move-left
      "C-<down>"        #'+evil/window-move-down
      "C-<up>"          #'+evil/window-move-up
      "C-<right>"       #'+evil/window-move-right)

;;(setq-default major-mode 'org-mode)

(setq doom-font (font-spec :family "Iosevka Nerd Font Mono" :style "Medium Oblique" :size 16)
      doom-big-font (font-spec :family "Iosevka Nerd Font Mono" :style "Medium Oblique" :size 24)
      doom-variable-pitch-font (font-spec :family "Overpass Nerd Font" :size 16)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "BlexMono Nerd Font" :weight 'light))

(setq doom-theme 'doom-one)
(remove-hook 'window-setup-hook #'doom-init-theme-h )
(add-hook 'after-init-hook #'doom-init-theme-h 'append)
(delq! t custom-theme-load-path)

(custom-set-faces!
  '(doom-modeline-buffer-modified :foreground "orange"))

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (and (memq (plist-get (coding-system-plist buffer-file-coding-system) :category)
                                 '(coding-category-undecided coding-category-utf-8))
                           (not (memq (coding-system-eol-type buffer-file-coding-system) '(1 2))))
                t)))
(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding )

(setq display-line-numbers-type 'relative)

(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")

(setq frame-title-format
      '(""
        (:eval
         (if (s-contains-p org-roam-directory (or buffer-file-name ""))
             (replace-regexp-in-string
              ".*/[0-9]*-?" "☰ "
              (subst-char-in-string ?_ ? buffer-file-name))
           "%b"))
        (:eval
         (let ((project-name (projectile-project-name)))
           (unless (string= "-" project-name)
             (format (if (buffer-modified-p) " ◉ %s" "  ●  %s") project-name))))))

;;(defvar fancy-splash-image-template
;;  (expand-file-name "./misc/splash-images/Doom_Game1.svg" doom-private-dir)
;;  "Default template svg used for the splash image, with substitutions from ")
;;
;;(defvar fancy-splash-sizes
;;  `((:height 300 :min-height 50  :padding (0 . 2))
;;    (:height 250 :min-height 42  :padding (2 . 4))
;;    (:height 200 :min-height 35  :padding (3 . 3))
;;    (:height 150 :min-height 28  :padding (3 . 3))
;;    (:height 100 :min-height 20  :padding (2 . 2))
;;    (:height 75  :min-height 15  :padding (2 . 1))
;;    (:height 50  :min-height 10  :padding (1 . 0))
;;    (:height 1   :min-height 0   :padding (0 . 0)))
;;  "list of plists with the following properties
;;  :height the height of the image
;;  :min-height minimum `frame-height' for image
;;  :padding `+doom-dashboard-banner-padding' (top . bottom) to apply
;;  :template non-default template file
;;  :file file to use instead of template")
;;
;;(defvar fancy-splash-template-colors
;;  '(("$color1" . keywords) ("$color2" . type) ("$color3" . base5) ("$color4" . base8))
;;  "list of the color-replacement alists of the form (\"$placeholder\" . 'theme-color) which is applied to the template")
;;
;;(unless (file-exists-p (expand-file-name "theme-splashes" doom-cache-dir))
;;  (make-directory (expand-file-name "theme-splashes" doom-cache-dir) t))
;;
;;(defun fancy-splash-filename (theme-name height)
;;  (expand-file-name (concat (file-name-as-directory "theme-splashes")
;;                            theme-name
;;                            "-" (number-to-string height) ".svg")
;;                    doom-cache-dir))
;;
;;(defun fancy-splash-clear-cache ()
;;  "Delete all cached fancy splash images"
;;  (interactive)
;;  (delete-directory (expand-file-name "theme-splashes" doom-cache-dir) t)
;;  (message "Cache cleared!"))
;;
;;(defun fancy-splash-generate-image (template height)
;;  "Read TEMPLATE and create an image if HEIGHT with color substitutions as described by `fancy-splash-template-colors' for the current theme"
;;  (with-temp-buffer
;;    (insert-file-contents template)
;;    (re-search-forward "$height" nil t)
;;    (replace-match (number-to-string height) nil nil)
;;    (dolist (substitution fancy-splash-template-colors)
;;      (goto-char (point-min))
;;      (while (re-search-forward (car substitution) nil t)
;;        (replace-match (doom-color (cdr substitution)) nil nil)))
;;    (write-region nil nil
;;                  (fancy-splash-filename (symbol-name doom-theme) height) nil nil)))
;;
;;(defun fancy-splash-generate-images ()
;;  "Perform `fancy-splash-generate-image' in bulk"
;;  (dolist (size fancy-splash-sizes)
;;    (unless (plist-get size :file)
;;      (fancy-splash-generate-image (or (plist-get size :template)
;;                                       fancy-splash-image-template)
;;                                   (plist-get size :height)))))
;;
;;(defun ensure-theme-splash-images-exist (&optional height)
;;  (unless (file-exists-p (fancy-splash-filename
;;                          (symbol-name doom-theme)
;;                          (or height
;;                              (plist-get (car fancy-splash-sizes) :height))))
;;    (fancy-splash-generate-images)))
;;
;;(defun get-appropriate-splash ()
;;  (let ((height (frame-height)))
;;    (cl-some (lambda (size) (when (>= height (plist-get size :min-height)) size))
;;             fancy-splash-sizes)))
;;
;;(setq fancy-splash-last-size nil)
;;(setq fancy-splash-last-theme nil)
;;(defun set-appropriate-splash (&rest _)
;;  (let ((appropriate-image (get-appropriate-splash)))
;;    (unless (and (equal appropriate-image fancy-splash-last-size)
;;                 (equal doom-theme fancy-splash-last-theme)))
;;    (unless (plist-get appropriate-image :file)
;;      (ensure-theme-splash-images-exist (plist-get appropriate-image :height)))
;;    (setq fancy-splash-image
;;          (or (plist-get appropriate-image :file)
;;              (fancy-splash-filename (symbol-name doom-theme) (plist-get appropriate-image :height))))
;;    (setq +doom-dashboard-banner-padding (plist-get appropriate-image :padding))
;;    (setq fancy-splash-last-size appropriate-image)
;;    (setq fancy-splash-last-theme doom-theme)
;;    (+doom-dashboard-reload)))
;;
;;(add-hook 'window-size-change-functions #'set-appropriate-splash )
;;(add-hook 'doom-load-theme-hook #'set-appropriate-splash )

(after! centaur-tabs
  (centaur-tabs-mode -1)
  (setq centaur-tabs-height 36
        centaur-tabs-set-icons t
        centaur-tabs-modified-marker "o"
        centaur-tabs-close-button "×"
        centaur-tabs-set-bar 'above
        centaur-tabs-gray-out-icons 'buffer))

(defun greedily-do-daemon-setup ()
  (require 'org)
  (when (require 'mu4e nil t)
    (setq mu4e-confirm-quit t)
    (setq +mu4e-lock-greedy t)
    (setq +mu4e-lock-relaxed t)
    (+mu4e-lock-add-watcher)
    (when (+mu4e-lock-available t)
      (mu4e-start)))
  (when (require 'elfeed nil t)
    (run-at-time nil (* 8 60 60) #'elfeed-update )))

(when (daemonp)
  (add-hook 'emacs-startup-hook #'greedily-do-daemon-setup)
  (add-hook! 'server-after-make-frame-hook (switch-to-buffer +doom-dashboard-name)))

(after! company
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (add-hook 'evil-normal-state-entry-hook #'company-abort ))
(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

(set-company-backend!
  '(text-mode
    markdown-mode
    gfm-mode)
  '(:separate
    company-ispell
    company-files
    company-yasnippet))

(set-company-backend! 'ess-r-mode '(company-R-args company-R-objects company-dabbrev-code :separate))

(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-include-deadlines t
        org-agenda-block-separator nil
        org-agenda-compact-blocks t
        org-agenda-start-day nil        ; i.e. today
        org-agenda-span 1
        org-agenda-start-on-weekday nil)
  (setq org-agenda-custom-commands
        '(("c" "Super view"
           ((agenda "" ((org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         '((:name "Today"
                            :time-grid t
                            :date today
                            :order 1)))))
            (alltodo "" ((org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          '((:log t)
                            (:name "To Refile"
                             :file-path "refile\\.org")
                            (:name "Next To Do"
                             :todo "NEXT"
                             :order 1)
                            (:name "Important"
                             :priority "A"
                             :order 6)
                            (:name "Today's Task"
                             :file-path "journal/")
                            (:name "Due Today"
                             :deadline today
                             :order 2)
                            (:name "Scheduled Soon"
                             :scheduled future
                             :order 8)
                            (:name "Overdue"
                             :deadline past
                             :order 7)
                            (:name "Meetings"
                             :and (:todo "MEET" :scheduled future)
                             :order 10)
                            (:discard (:not (:todo "TODO")))))))))))
  :config
  (org-super-agenda-mode))

(map! :leader
      (:prefix ("j" . "journal")        ;; org-journal bindings
       :desc "Create new journal entry" "j" #'org-journal-new-entry
       :desc "Open previous entry" "p" #'org-journal-open-previous-entry
       :desc "Open next entry" "n" #'org-journal-open-next-entry
       :desc "Search journal" "s" #'org-journal-search-forever))
;; The built-in calendar mode mappings for org-journal
;; conflict with evil bindings
(map!
 (:map calendar-mode-map
  :n "o" #'org-journal-display-entry
  :n "p" #'org-journal-previous-entry
  :n "n" #'org-journal-next-entry
  :n "O" #'org-journal-new-date-entry ))

(use-package! org-pretty-table :commands (org-pretty-table-mode global-org-pretty-table-mode))

(use-package! org-ol-tree
  :commands org-ol-tree)
(map! :map org-mode-map
      :after org
      :localleader
      :desc "Outline" "O" #'org-ol-tree)

(use-package! org-transclusion
  :commands org-transclusion-mode
  :init
  (map! :after org :map org-mode-map
        "<f12>" #'org-transclusion-mode ))

(use-package! org-roam-server
  :after (org-roam server)
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8078
        org-roam-server-export-inline-image t
        org-roam-server-authenticate nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20)
  (defun org-roam-server-open ()
    "Ensure the server is active, then open the roam graph."
    (interactive)
    (org-roam-server-mode 1)
    (browse-url-xdg-open (format "http://localhost:%d" org-roam-server-post))))

(use-package! page-break-lines
  :commands page-break-lines-mode
  :init
  (autoload 'turn-on-page-break-lines-mode "page-break-lines")
  :config
  (setq page-break-lines-max-width fill-column)
  (map! :prefix "g"
        :desc "Prev page break" :nv "[" #'backward-page
        :desc "Next page break" :nv "]" #'forward-page ))

(use-package! ox-gfm :after org)

(use-package! authinfo-color-mode
  :mode ("authinfo.gpg\\'" . authinfo-color-mode)
  :init (advice-add 'authinfo-mode :override #'authinfo-color-mode ))

(setq elcord-use-major-mode-as-main-icon t)

(setq emojify-emoji-set "twemoji-v2")

(defvar emojify-disabled-emojis
  '(;; Org
    "◼" "☑" "☸" "⚙" "⏩" "⏪" "⬆" "⬇" "❓"
    ;; Terminal powerline
    "✔"
    ;; Box drawing
    "▶" "◀")
  "Characters that should never be affected by `emojify-mode'.")

(defadvice! emojify-delete-from-data ()
  "Ensure `emojify-disabled-emojis' don't appear in `emojify-emojis'."
  :after #'emojify-set-emoji-data
  (dolist (emoji emojify-disabled-emojis)
    (remhash emoji emojify-emojis)))
;; hook new minor mode to email an irc
(add-hook! '(mu4e-compose-mode org-msg-edit-mode circe-channel-mode) (emoticon-to-emoji 1))

(setq eros-eval-result-prefix "⟹ ")

(after! doom-modeline
  (doom-modeline-def-segment buffer-name
    "Display the current buffer's name, without any other information."
    (concat
     (doom-modeline-spc)
     (doom-modeline--buffer-name)))
  (doom-modeline-def-segment pdf-icon
    "PDF icon from all-the-icons."
    (concat
     (doom-modeline-spc)
     (doom-modeline-icon 'octicon "file-pdf" nil nil
                         :face (if (doom-modeline--active)
                                   'all-the-icons-red
                                 'mode-line-inactive)
                         :v-adjust 0.02)))
  (defun doom-modeline-update-pdf-pages ()
    "Update PDF pages."
    (setq doom-modeline--pdf-pages
          (let ((current-page-str (number-to-string (eval `(pdf-view-current-page))))
                (total-page-str (number-to-string (pdf-cache-number-of-pages))))
            (concat
             (propertize
              (concat (make-string (- (length total-page-str) (length current-page-str)) ? )
                      " P" current-page-str)
              'face 'mode-line)
             (propertize (concat "/" total-page-str) 'face 'doom-modeline-buffer-minor-mode)))))
  (doom-modeline-def-modeline 'pdf
    '(bar window-number pdf-pages pdf-icon buffer-name)
    '(misc-info matches major-mode process vcs)))

(use-package! emacs-everywhere
  :if (daemonp)
  :config
  (require 'spell-fu)
  (setq emacs-everywhere-major-mode-function #'org-mode
        emacs-everywhere-frame-name-format "Edit ∷ %s — %s")
  (defadvice! emacs-everywhere-raise-frame ()
    :after #'emacs-everywhere-set-frame-name
    (setq emacs-everywhere-frame-name (format emacs-everywhere-frame-name-format
                                              (emacs-everywhere-app-class emacs-everywhere-current-app)
                                              (truncate-string-to-width
                                               (emacs-everywhere-app-title emacs-everywhere-current-app)
                                               45 nil nil "…")))
    ;; need to wait until frame refresh happens before really set
    (run-with-timer 0.1 nil #'emacs-everywhere-raise-frame-1 ))
  (defun emacs-everywhere-raise-frame-1 ()
    (call-process "wmctrl" nil nil nil "-a" emacs-everywhere-frame-name)))

;: `
