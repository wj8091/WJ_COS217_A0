;=======================================================================
; .emacs: The Emacs initialization file.
; Emacs executes this file whenever it is launched.
;=======================================================================

(if (version< emacs-version "26.3")
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
    nil)

; Create (or don't create) backup files.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq-default make-backup-files t)
; (setq-default make-backup-files nil)

;-----------------------------------------------------------------------

; Set the indentation style for C code.
(setq c-default-style "ellemtel")
; (setq c-default-style "cc-mode")
; (setq c-default-style "gnu")
; (setq c-default-style "k&r")
; (setq c-default-style "bsd")
; (setq c-default-style "stroustrup")

;-----------------------------------------------------------------------

; Display (or don't display) trailing whitespace characters using an
; unusual background color so they are visible.
; (setq-default show-trailing-whitespace t)
(setq-default show-trailing-whitespace nil)

;-----------------------------------------------------------------------

; Set the "Control-x w" key sequence to call the function
; "delete-trailing-whitespace".
(global-set-key "\C-xw" 'delete-trailing-whitespace)

;-----------------------------------------------------------------------

; Turn on (or off) syntax highlighting.
(global-font-lock-mode t)
; (global-font-lock-mode nil)

;-----------------------------------------------------------------------

; Display (or don't display) the column number in the status bar.
(setq column-number-mode t)
; (setq column-number-mode nil)

;-----------------------------------------------------------------------

; Highlight (or don't highlight) the region bounded by the mark and
; the point.
(setq transient-mark-mode t)
; (setq transient-mark-mode nil)

;-----------------------------------------------------------------------

; Highlight (or don't highlight) matching parentheses, braces, and
; brackets.
(show-paren-mode t)
; (show-paren-mode nil)

;-----------------------------------------------------------------------

; Bind the "Control-x l" (the letter "ell") key sequence to
; the function "goto-line".
(global-set-key "\C-xl" 'goto-line)

;-----------------------------------------------------------------------

; Bind the Home and End keys for PuTTY.
(global-set-key "\C-[[1~" 'beginning-of-line)
(global-set-key "\C-[[4~" 'end-of-line)

; Bind the Home and End keys for the Linux GNOME Terminal.
(global-set-key "\C-[OH" 'beginning-of-line)
(global-set-key "\C-[OF" 'end-of-line)

;-----------------------------------------------------------------------

; Indent using spaces instead of tabs, but not in makefile-mode.
(defun myIndentUsingSpaces () (setq indent-tabs-mode nil))
(add-hook 'text-mode-hook 'myIndentUsingSpaces)
(add-hook 'c-mode-hook 'myIndentUsingSpaces)
(add-hook 'asm-mode-hook 'myIndentUsingSpaces)
(add-hook 'java-mode-hook 'myIndentUsingSpaces)
(add-hook 'python-mode-hook 'myIndentUsingSpaces)
(add-hook 'emacs-lisp-mode-hook 'myIndentUsingSpaces)

;-----------------------------------------------------------------------

; When using an X-Window System server, make the scroll bar appear
; on the right (or left).
(set-scroll-bar-mode `right)
; (set-scroll-bar-mode `left)

;-----------------------------------------------------------------------

; Make the Control-n and Control-p keys (and the down arrow and up
; arrow keys) scroll the current window one line at a time instead
; of one-half screen at a time.
(setq scroll-step 1)

;-----------------------------------------------------------------------

; Bind the "Control-x p" key sequence to the function "indent-all".
; The "indent-all" function indents all lines of the C program in the
; current buffer according to the selected indentation style.
(defun indent-all()
   (interactive)
   (save-excursion
      (let ()
         (goto-char (point-min))
         (while (< (point) (point-max))
            (c-indent-command)
            (next-line 1))))
   (delete-trailing-whitespace))
(global-set-key "\C-xp" 'indent-all)

;-----------------------------------------------------------------------

; Tell Emacs where to find plug-in (.el) files.
(setq load-path (cons "~cos217/lib" load-path))

;-----------------------------------------------------------------------

; Bind the "Control-x n" key sequence to call the function "linum-mode",
; thus toggling line numbering.
(require 'linum)
(global-set-key "\C-xn" 'linum-mode)
; (defun mySetLinumMode () (interactive) (linum-mode 1))
; (add-hook 'text-mode-hook 'mySetLinumMode)
; (add-hook 'c-mode-hook 'mySetLinumMode)
; (add-hook 'asm-mode-hook 'mySetLinumMode)
; (add-hook 'java-mode-hook 'mySetLinumMode)
; (add-hook 'python-mode-hook 'mySetLinumMode)
; (add-hook 'emacs-lisp-mode-hook 'mySetLinumMode)
; (add-hook 'makefile-mode-hook 'mySetLinumMode)

;-----------------------------------------------------------------------

; Display characters in columns 72 and 73 using unusual background
; colors, thus making it easy to spot lines that are longer than 72
; characters.
(require 'column-marker)
(defun myMarkCol ()
   (interactive)
   (column-marker-1 72)
   (column-marker-2 71))
(add-hook 'font-lock-mode-hook 'myMarkCol)

;-----------------------------------------------------------------------

; Define gdb as an alias for gud-gdb. See the emacs manual for details.
(defalias 'gdb 'gud-gdb)

;-----------------------------------------------------------------------

; Added by emacs.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCDC"])
 '(custom-safe-themes
   '("2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "162201cf5b5899938cfaec99c8cb35a2f1bf0775fc9ccbf5e63130a1ea217213" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "ae426fc51c58ade49774264c17e666ea7f681d8cae62570630539be3d06fd964" "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a" "ac18cc10455c6c26a98354ba8f9d338842d7ecc9ae3d28c205ed154ef20d74ce" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" default))
 '(exwm-floating-border-color "#262626")
 '(fci-rule-color "#4F4F4F")
 '(highlight-tail-colors ((("#454845") . 0) (("#474f4f") . 20)))
 '(inhibit-startup-screen t)
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#8CD0D3"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#7F9F7F"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#494949"))
 '(objed-cursor-color "#CC9393")
 '(package-selected-packages '(doom-themes company company-c-headers evil))
 '(pdf-view-midnight-colors (cons "#DCDCDC" "#3F3F3F"))
 '(rustic-ansi-faces
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCDC"])
 '(vc-annotate-background "#3F3F3F")
 '(vc-annotate-color-map
   (list
    (cons 20 "#7F9F7F")
    (cons 40 "#a4b48f")
    (cons 60 "#cac99f")
    (cons 80 "#F0DFAF")
    (cons 100 "#eacfa4")
    (cons 120 "#e4bf99")
    (cons 140 "#DFAF8F")
    (cons 160 "#dea3a0")
    (cons 180 "#dd97b1")
    (cons 200 "#DC8CC3")
    (cons 220 "#d68eb3")
    (cons 240 "#d190a3")
    (cons 260 "#CC9393")
    (cons 280 "#ab8080")
    (cons 300 "#8a6d6d")
    (cons 320 "#695b5b")
    (cons 340 "#4F4F4F")
    (cons 360 "#4F4F4F")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/elpa/")

;; List of packages to ensure are installed at launch
(defvar my/packages
  '(use-package
    doom-themes
    company ;; autocomplete within program
    company-c-headers ;; autocomplete for headers
    flycheck ;; syntax checking
    )
  "A list of packages to ensure are installed at initialization.")

(defvar package-archive-contents-file "~/.emacs.d/package-archive-contents.cache"
  "Path to cache file for `package-archive-contents`.")

(defun save-package-archive-contents ()
  "Save the `package-archive-contents` variable to a cache file."
  (with-temp-file package-archive-contents-file
    (print package-archive-contents (current-buffer))))

(add-hook 'kill-emacs-hook #'save-package-archive-contents)

(defun load-package-archive-contents ()
  "Load the cached `package-archive-contents` from a file."
  (when (file-exists-p package-archive-contents-file)
    (with-temp-buffer
      (insert-file-contents package-archive-contents-file)
      (setq package-archive-contents (read (current-buffer))))))

(load-package-archive-contents)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (p my/packages)
  (unless (package-installed-p p)
    (package-install p)))

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-one t)

(require 'company)
(add-hook 'global-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)

(global-company-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(set-face-underline 'flycheck-error "red")
(set-face-underline 'flycheck-warning "yellow")
(set-face-underline 'flycheck-info "blue")

(xterm-mouse-mode 1)
(global-set-key "\C-x\\" "\C-x3")
(global-set-key "\C-x-" "\C-x2")
(cua-mode 1)