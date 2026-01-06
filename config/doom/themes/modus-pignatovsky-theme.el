;;; modus-pignatovsky-theme.el --- Theme

;; Copyright (C) 2026 , PigNatovsky

;; Author: PigNatovsky
;; Version: 0.1
;; Package-Requires: ((emacs "24.1"))

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:
;;; modus-pignatovsky theme created by PigNatovsky in 2026
;;; Based on Modus Operandi (Tinted) overrides from Neovim config.
;;; Optimized for Deutan color blindness (High Contrast, Bold Typeface).

;;; Code:

(deftheme modus-pignatovsky)
(let ((class '((class color) (min-colors 89)))
      (fg-main "#0a0a0a")       ; Normal Text
      (bg-main "#fbf7f0")       ; Background (Warm/Beige)
      (fg-dim  "#595959")       ; Comments
      (fg-alt  "#a0a0a0")       ; UI Elements (LineNr, Splits)
      (fg-bold "#000000")       ; Keywords, Types, Functions
      (fg-accent "#005faf")     ; Strings, Constants, Special (Blue)
      (bg-selection "#f5d0a9")  ; Visual Selection (Sand/Yellow)
      (bg-search    "#efc535")  ; Search Match (Yellow)
      (bg-diff-add  "#e8f0f8")  ; Diff Add Bg
      (fg-diff-add  "#005faf")  ; Diff Add Fg
      (fg-diff-del  "#808080")  ; Diff Del Fg
      (warning      "#ff0000")
      (warning2     "#ff8800")
      (unspec       (when (>= emacs-major-version 29) 'unspecified)))
  (custom-theme-set-faces
   'modus-pignatovsky
   `(default ((,class (:background ,bg-main :foreground ,fg-main))))
   `(font-lock-builtin-face ((,class (:foreground ,fg-bold :weight bold))))
   `(font-lock-comment-face ((,class (:foreground ,fg-dim :slant italic))))
   `(font-lock-negation-char-face ((,class (:foreground ,fg-accent))))
   `(font-lock-reference-face ((,class (:foreground ,fg-accent))))
   `(font-lock-constant-face ((,class (:foreground ,fg-accent :weight bold))))
   `(font-lock-doc-face ((,class (:foreground ,fg-dim :slant italic))))
   `(font-lock-function-name-face ((,class (:foreground ,fg-bold :weight bold))))
   `(font-lock-keyword-face ((,class (:foreground ,fg-bold :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,fg-accent))))
   `(font-lock-type-face ((,class (:foreground ,fg-bold :weight bold))))
   `(font-lock-variable-name-face ((,class (:foreground ,fg-main))))
   `(font-lock-warning-face ((,class (:foreground ,warning :weight bold))))
   
   ;; UI
   `(region ((,class (:background ,bg-selection :foreground ,fg-bold))))
   `(highlight ((,class (:background ,bg-diff-add))))
   `(hl-line ((,class (:background ,bg-diff-add))))
   `(fringe ((,class (:background ,bg-main :foreground ,fg-alt))))
   `(cursor ((,class (:background ,fg-main))))
   `(isearch ((,class (:weight bold :foreground ,fg-bold :background ,bg-search))))
   `(lazy-highlight ((,class (:foreground ,fg-bold :background ,bg-selection))))

   ;; Modeline
   `(mode-line ((,class (:box (:line-width 1 :color ,fg-alt) :weight bold :foreground ,fg-bold :background "#e0e0e0"))))
   `(mode-line-inactive ((,class (:box (:line-width 1 :color ,fg-alt) :foreground ,fg-dim :background "#f0f0f0"))))
   
   ;; Line Numbers
   `(line-number ((,class (:foreground ,fg-alt :background ,bg-main))))
   `(line-number-current-line ((,class (:foreground ,fg-bold :weight bold :background ,bg-main))))
   
   ;; Org Mode
   `(org-level-1 ((,class (:weight bold :foreground ,fg-bold :height 1.2))))
   `(org-level-2 ((,class (:weight bold :foreground ,fg-bold :height 1.1))))
   `(org-level-3 ((,class (:weight bold :foreground ,fg-dim))))
   `(org-level-4 ((,class (:weight normal :foreground ,fg-dim))))
   `(org-code ((,class (:foreground ,fg-accent))))
   `(org-hide ((,class (:foreground ,bg-main))))
   `(org-link ((,class (:underline t :foreground ,fg-accent))))
   `(org-block ((,class (:foreground ,fg-dim))))
   `(org-todo ((,class (:box (:line-width 1 :color ,fg-dim) :foreground ,fg-bold :weight bold))))
   `(org-done ((,class (:box (:line-width 1 :color ,fg-alt) :weight bold :foreground ,fg-alt))))

   ;; Magit (Git)
   `(magit-diff-added ((,class (:foreground ,fg-diff-add :background ,bg-diff-add))))
   `(magit-diff-removed ((,class (:foreground ,fg-diff-del :background "#f0f0f0" :strike-through t))))
   `(magit-diff-context ((,class (:foreground ,fg-dim))))
   `(magit-section-heading ((,class (:foreground ,fg-bold :weight bold))))
   `(magit-branch-local ((,class (:foreground ,fg-accent :weight bold))))
   
   ;; Term
   `(term-color-black ((,class (:foreground ,fg-main :background ,fg-main))))
   `(term-color-red ((,class (:foreground ,warning :background ,warning))))
   `(term-color-green ((,class (:foreground ,fg-bold :background ,fg-bold))))
   `(term-color-yellow ((,class (:foreground ,bg-search :background ,bg-search))))
   `(term-color-blue ((,class (:foreground ,fg-accent :background ,fg-accent))))
   `(term-color-magenta ((,class (:foreground ,fg-accent :background ,fg-accent))))
   `(term-color-cyan ((,class (:foreground ,fg-accent :background ,fg-accent))))
   `(term-color-white ((,class (:foreground ,bg-main :background ,bg-main))))
   
   ;; Rainbow Delimiters (Reducing noise)
   `(rainbow-delimiters-depth-1-face ((,class :foreground ,fg-main)))
   `(rainbow-delimiters-depth-2-face ((,class :foreground ,fg-dim)))
   `(rainbow-delimiters-depth-3-face ((,class :foreground ,fg-main)))
   `(rainbow-delimiters-depth-4-face ((,class :foreground ,fg-dim)))
   `(rainbow-delimiters-depth-5-face ((,class :foreground ,fg-main)))
   `(rainbow-delimiters-depth-6-face ((,class :foreground ,fg-dim)))
   `(rainbow-delimiters-depth-7-face ((,class :foreground ,fg-main)))
   `(rainbow-delimiters-depth-8-face ((,class :foreground ,fg-dim)))
   `(rainbow-delimiters-unmatched-face ((,class :foreground ,warning)))
   
   ;; Tree Sitter / Modern Faces
   `(font-lock-operator-face ((,class (:foreground ,fg-bold))))
   `(font-lock-punctuation-face ((,class (:foreground ,fg-main))))
   `(font-lock-bracket-face ((,class (:foreground ,fg-main))))
   `(font-lock-delimiter-face ((,class (:foreground ,fg-main))))
   
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'modus-pignatovsky)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; modus-pignatovsky-theme.el ends here
