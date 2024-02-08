(setq package-enable-at-startup nil)
(message "in early-init!")

(defun my/is-android-p ()
  (string-equal system-type "android"))

(when (my/is-android-p)
  (message "hello android!")
  (setenv "PATH" (format "%s:%s" "/data/data/com.termux/files/usr/bin" (getenv "PATH")))
  (setenv "LD_LIBRARY_PATH" (format "%s:%s"
                                    "/data/data/com.termux/files/usr/lib"
                                    (getenv "LD_LIBRARY_PATH")))
  (setq magit-git-executable "/data/data/com.termux/files/usr/bin/git")
  (push "/data/data/com.termux/files/usr/bin" exec-path))
