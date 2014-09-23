(defun my/reindent-buffer ()
  "Reindent entire buffer."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (indent-region))
  )

(defun my/replace-string-whole-buffer ()
  "Whole buffer version of replace-string."
   (interactive)
   (save-excursion
      (beginning-of-buffer)
      (call-interactively 'replace-string)))

(defun my/replace-regexp-whole-buffer ()
  "Whole buffer version of replace-regexp."
   (interactive)
   (save-excursion
      (beginning-of-buffer)
      (call-interactively 'replace-regexp)))
