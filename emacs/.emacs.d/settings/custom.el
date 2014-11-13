
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds
   (quote
    ("http://feeds.arstechnica.com/arstechnica/index?format=xml" "http://feeds.feedburner.com/boingboing/iBag" "http://www.bom.gov.au/fwo/IDZ00063.warnings_land_qld.xml" "http://feeds.feedburner.com/codinghorror?format=xml" "http://daringfireball.net/index.xml" "http://feeds.feedburner.com/Delimiter?format=xml" "http://blog.erratasec.com/feeds/posts/default?alt=rss" "http://feeds.feedburner.com/GitBlame?format=xml" "http://krebsonsecurity.com/feed/" "http://torvalds-family.blogspot.com/feeds/posts/default" "http://feeds.feedburner.com/NationalReport" "http://recode.net/feed/" "https://www.schneier.com/blog/atom.xml" "http://stilgherrian.com/feed/" "http://stilldrinking.org/rss/feed.xml" "http://feeds.feedburner.com/TechCrunch/" "http://syndication.thedailywtf.com/TheDailyWtf" "http://feeds.feedburner.com/TheBestPageInTheUniverse" "http://www.hackerfactor.com/blog/index.php?/feeds/index.rss2" "http://blogs.msdn.com/b/oldnewthing/rss.aspx" "http://feeds.theonion.com/theonion/daily" "http://www.theregister.co.uk/headlines.atom" "http://thingsboganslike.com/feed" "http://feeds.feedburner.com/holman"))))

; color theme
(add-to-list 'custom-theme-load-path (make-plugin-path "color-theme-tango"))
(load-theme 'tango-dark 1)

(require 'faces)
(if (system-is-mac)
    (set-face-attribute 'default nil
			:foundry "apple" 
			:family "Monaco"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
