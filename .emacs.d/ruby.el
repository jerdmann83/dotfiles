(defun my/toggle-ruby-indent ()
  "Completely non-working ruby indent toggle."
  (interactive)
  (setq ruby-indent-level (if (= ruby-indent-level 2) 4 2))
  (message (format "Set ruby indent level to %d." ruby-indent-level))
  )
