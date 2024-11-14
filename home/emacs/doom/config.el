;;; tangled from $DOOMDIR/config.org -*- mode: emacs-lisp; lexical-binding: t; -*

(setq user-full-name "Aqeel Ahmad Akber"
      user-mail-address "aqeel@aqeelakber.com"
      mail-host-address "aqeelakber.com")

(setq version-control t        ;; OpenVMS-esque
      backup-by-copying t      ;; Copy-on-write-esque
      kept-new-versions 64     ;; Indeliable-ink-esque
      kept-old-versions 0      ;;
      delete-old-versions nil  ;;
      )

(setq backup-directory-alist   ;; Save backups in $(pwd)/.bak
      '(("." . ".bak"))        ;;
      )

(setq doom-theme 'leuven)

(setq display-line-numbers-type 't)

(after! org
  (setq org-log-done t)
  (setq org-log-into-drawer t)

  (setq org-directory "~/org/")
  (setq org-agenda-files '("~/org/" "~/org/dsq/"))
  ;;(add-to-list 'org-agenda-files org-journal-dir)
  (setq org-journal-enable-agenda-integration t)
  (setq org-export-with-broken-links 'mark)
  )

(after! org
  (setq org-attach-directory "attach/") ;; attachments in directory
  )

(after! org
  (setq org-agenda-start-on-weekday t) ;; start on monday
  (setq org-agenda-include-diary t) ;; include holidays sunsets, etc
  (setq org-agenda-span 28) ;; show four weeks
  (setq org-agenda-start-day "-7d") ;; but start from last week
  )

(after! org
  (setq org-log-done 'note
        org-log-redeadline 'note
        org-log-reschedule 'note
        )
  )

(after! org
  (setq org-log-refile 'note)
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  )

(after! org
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance '("crypt"))
  (setq org-crypt-key "")       ;; Set CRYPTKEY property to use id
  (setq auto-save-default nil)  ;; security flaw when using encryption
  )

(setq time-stamp-active t
      time-stamp-start "#\\+lastmod:[ \t]*"
      time-stamp-end "$"
      time-stamp-format "[%04Y-%02m-%02d %a %H:%M]")
(add-hook 'before-save-hook 'time-stamp nil)

(use-package! org-octopress
  :config
  (setq org-octopress-directory-top "~/blog/src"
        org-octopress-directory-posts "~/blog/src/_posts"
        org-octopress-directory-org-top "~/blog/src"
        org-octopress-directory-org-posts "~/blog/src/blog"
        org-octopress-setup-file "~/blog/src/setupfile.org"
        )
  )

(use-package! org-roam
  :config
  (setq org-roam-database-connector 'sqlite-builtin)
  (setq org-roam-directory (file-truename "~/org/org-roam"))
  ;; org-roam-dailies
  (setq org-roam-dailies-directory "daily/")
  (setq org-roam-dailies-capture-templates
        '(("d" "default" entry
           "* %?"
           :target (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%Y-%m-%d>\n"))))
    (org-roam-db-autosync-mode)
  )

(use-package! org-roam-protocol)

(use-package! org-roam-export)

(use-package! notmuch
  :init
  (setq message-directory "~/mail")
  (setq send-mail-function 'sendmail-send-it)
  ;; brute force all the fixes over the years to send from correct email account
  (setq message-sendmail-f-is-eval 't)
  (setq message-sendmail-extra-arguments '("--read-envelope-from"))
  (setq mail-specify-envelope-from 't)
  (setq mail-envelope-from 'header)
  (setq message-sendmail-envelope-from 'header)
  :config
  (setq notmuch-show-logo nil)
  ;; writing emails
  (setq message-default-mail-headers "Cc: \nBcc: \n") ;; always show bcc
  (setq notmuch-always-prompt-for-sender 't)
  ;; pgp support
  (setq mml-secure-openpgp-sign-with-sender t)
  (add-hook 'message-setup-hook 'mml-secure-sign-pgpmime)

  (setq notmuch-crypto-process-mime t)
  ;; save sent mail in the folders depending on from address
  (setq notmuch-fcc-dirs '(("aqeel.akber@gmail.com" . "gmail/sent")
                           ("aqeel@aqeelakber.com" . "aqeel/sent")
                           ("aqeel.akber@anu.edu.au" . "anu/sent")
                           ))
    )

;; (global-company-mode 't)
;; (setq company-idle-delay 0
;;       company-echo-delay 0

;;       company-minimum-prefix-length 2)
