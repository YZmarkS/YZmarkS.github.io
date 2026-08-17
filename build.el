(require 'ox-publish)

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "main-pages"
             :recursive t
             :base-directory "./Content"
             :publishing-directory "./public_html"
             :publishing-function 'org-html-publish-to-html
	     :with-author nil
	     :with-toc nil)
       (list "static"
	     :recursive t
	     :base-directory "./Content"
	     :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mps"
	     :publishing-directory "./public_html"
	     :publishing-function 'org-publish-attachment)))

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head "<link rel=\"stylesheet\" href=\"/style.css\">")

(org-publish-all t)

(message "Build complete")
