(defun my/reindent-buffer ()
  "Reindent entire buffer."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (indent-region (region-beginning) (region-end))))

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

(defun my/copy-whole-buffer ()
  "Copy the entire buffer to the clipboard."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (copy-region-as-kill (region-beginning) (region-end))))

(defun my/reindent-copy-whole-buffer ()
  "Reindent and copy the whole buffer to the clipboard."
  (interactive)
  (my/reindent-buffer)
  (my/copy-whole-buffer))
