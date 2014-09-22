(defun my/reindent-buffer ()
  "Reindent entire buffer."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (indent-region))
  )
