;;; ../../workspace/github/pignatovsky/dotfiles/config/doom/themes/acme-pignatovsky-v2-theme.el -*- lexical-binding: t; -*-

(deftheme acme-pignatovsky-v2
  "Accessible Acme-inspired theme with minimal semantic cues.")

(let ((class '((class color) (min-colors 89)))
      ;; foregrounds
      (fg-main "#000000")
      (fg-soft "#2e2e2e")
      (fg-muted "#4a4a4a")
      (fg-faint "#6b6b6b")

      ;; backgrounds
      (bg-main "#f3f4a9")
      (bg-soft "#e0e09b")
      (bg-muted "#cccd8e")
      (bg-strong "#b9b980")

      ;; semantic accents (low saturation)
      (accent-blue "#2a3a5e")
      (accent-blue-soft "#3a4a6e")
      (accent-string "#1f2a44")
      (accent-warning "#9a4b00")
      (accent-warning-bg "#e6d28a")

      (unspec (when (>= emacs-major-version 29) 'unspecified)))

  (custom-theme-set-faces
   'acme-pignatovsky-v2

   ;; Core
   `(default ((,class (:background ,bg-main :foreground ,fg-main))))
   `(cursor  ((,class (:background ,fg-muted))))
   `(fringe  ((,class (:background ,bg-soft :foreground ,fg-faint))))
   `(hl-line ((,class (:background ,bg-soft))))
   `(region  ((,class (:background ,bg-strong))))
   `(highlight ((,class (:background ,bg-muted))))

   ;; Syntax
   `(font-lock-comment-face ((,class (:foreground ,fg-muted :slant italic))))
   `(font-lock-doc-face     ((,class (:inherit font-lock-comment-face))))
   `(font-lock-string-face  ((,class (:foreground ,accent-string))))
   `(font-lock-keyword-face ((,class (:foreground ,fg-main :weight bold))))
   `(font-lock-builtin-face ((,class (:foreground ,accent-blue))))
   `(font-lock-function-name-face ((,class (:foreground ,accent-blue-soft))))
   `(font-lock-type-face ((,class (:foreground ,accent-blue))))
   `(font-lock-variable-name-face ((,class (:foreground ,fg-main))))
   `(font-lock-constant-face ((,class (:foreground ,fg-main))))

   ;; Warnings / errors
   `(font-lock-warning-face
     ((,class (:foreground ,accent-warning
               :background ,accent-warning-bg
               :underline t))))

   `(warning ((,class (:foreground ,accent-warning :underline t))))

   ;; Search
   `(isearch ((,class (:foreground ,fg-main
                       :background ,bg-muted
                       :underline t
                       :weight bold))))
   `(lazy-highlight ((,class (:background ,bg-soft))))

   ;; Mode line
   `(mode-line
     ((,class (:foreground ,fg-soft
               :background ,bg-soft
               :box (:line-width 1 :color ,fg-muted)
               :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,fg-faint
               :background ,bg-main
               :box (:line-width 1 :color ,bg-soft)))))

   ;; Minibuffer
   `(minibuffer-prompt ((,class (:foreground ,accent-blue :weight bold))))

   ;; Links
   `(link ((,class (:foreground ,accent-blue :underline t))))

   ;; Org
   `(org-level-1 ((,class (:foreground ,fg-soft :weight bold :height 1.1))))
   `(org-level-2 ((,class (:foreground ,fg-muted))))
   `(org-level-3 ((,class (:foreground ,fg-faint))))
   `(org-code ((,class (:foreground ,accent-string))))
   `(org-block ((,class (:background ,bg-soft :foreground ,fg-soft))))
   `(org-todo ((,class (:foreground ,accent-warning :weight bold :underline t))))
   `(org-done ((,class (:foreground ,fg-faint :strike-through t))))

   ;; Terminal colors (ANSI – sane defaults)
   `(term-color-black   ((,class (:foreground ,fg-soft))))
   `(term-color-white   ((,class (:foreground ,fg-main))))
   `(term-color-red     ((,class (:foreground ,accent-warning))))
   `(term-color-yellow  ((,class (:foreground ,accent-warning))))
   `(term-color-blue    ((,class (:foreground ,accent-blue))))
   `(term-color-cyan    ((,class (:foreground ,accent-blue-soft))))
   `(term-color-green   ((,class (:foreground ,fg-muted))))
   `(term-color-magenta ((,class (:foreground ,fg-muted))))

   ;; Line numbers
   `(line-number ((,class (:foreground ,fg-faint :background ,bg-soft))))
   `(line-number-current-line
     ((,class (:foreground ,fg-main :background ,bg-soft :weight bold))))

   ;; Parentheses
   `(show-paren-match ((,class (:background ,bg-strong :weight bold))))
   `(show-paren-mismatch ((,class (:background ,accent-warning-bg :underline t))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'acme-pignatovsky-v2)
