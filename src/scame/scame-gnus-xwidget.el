
(require 'xwidget)

(require 'gnus-html)

(defun xw-gnus-article-html (&optional handle)
  (let ((article-buffer (current-buffer)))
    (unless handle
      (setq handle (mm-dissect-buffer t)))
    (save-restriction
      (narrow-to-region (point) (point))
      (save-excursion
	(mm-with-part handle
	  (let* ((coding-system-for-read 'utf-8)
		 (coding-system-for-write 'utf-8)
		 (default-process-coding-system
		   (cons coding-system-for-read coding-system-for-write))
		 (charset (mail-content-type-get (mm-handle-type handle)
						 'charset)))
	    (when (and charset
		       (setq charset (mm-charset-to-coding-system
				      charset nil t))
		       (not (eq charset 'ascii)))
	      (insert (prog1
			  (decode-coding-string (buffer-string) charset)
			(erase-buffer)
			(mm-enable-multibyte))))
	    (setq tf-handle (make-temp-file "/tmp/test.html"))
            (write-region (point-min) (point-max) tf-handle t)
            (xwidget-webkit-new-session (concat "file://" tf-handle))
            )))
      (gnus-html-wash-tags))))

(setq mm-text-html-renderer 'xw-gnus-article-html)
