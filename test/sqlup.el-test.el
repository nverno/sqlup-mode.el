
(ert-deftest upcase-select ()
  "Will upcase the word 'select' if it sees it"
  (with-temp-buffer
    (sql-mode)
    (insert "select")
    (sqlup-maybe-capitalize-symbol -1)
    (should (equal (buffer-string) "SELECT"))))

(ert-deftest upcase-a-region ()
  (with-temp-buffer
    (sql-mode)
    (insert "select count(*) from 'select' -- select")
    (set-mark (point-min))
    (call-interactively 'sqlup-capitalize-keywords-in-region)
    (should (equal (buffer-string) "SELECT COUNT(*) FROM 'select' -- select"))))

(ert-deftest upcase-a-region ()
  (with-temp-buffer
    (sql-mode)
    (insert "select count(*) from 'select' -- select")
    (call-interactively 'sqlup-capitalize-keywords-in-buffer)
    (should (equal (buffer-string) "SELECT COUNT(*) FROM 'select' -- select"))))
