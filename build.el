(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

(require 'ox-publish)

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "main-pages"
             :recursive t
             :base-directory "./Content"
             :publishing-directory "./docs"
             :publishing-function 'org-html-publish-to-html
	     :with-author nil
	     :with-toc nil
	     :section-numbers nil
	     :time-stamp-file nil
	     :htmlized-source t)
       (list "static"
	     :recursive t
	     :base-directory "./Content"
	     :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mps"
	     :publishing-directory "./docs"
	     :publishing-function 'org-publish-attachment)))

(setq org-html-validation-link nil
      org-html-htmlize-output-type 'css
      org-html-head-include-scripts nil
      ;; org-html-head-include-default-style nil
      org-html-head
      (concat "<link rel=\"stylesheet\" href=\"/org_theme.css\">"
	      "<link rel=\"stylesheet\" href=\"/style.css\">")

      org-html-preamble
      (concat "<div id=\"main-header\">"
	      "<a href=\"/index.html\">Home</a>"
	      "<a href=\"/Notes/index.html\">Notes</a>"
	      "<a href=\"/Development_Blog/index.html\">Development Blog</a>"
	      "</div>"))

(org-publish-all t)

(message "Build complete")
