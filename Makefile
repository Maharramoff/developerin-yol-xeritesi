.PHONY: serve setup sitemap

serve:
	jekyll serve --host=localhost

setup:
	@sudo gem install jekyll jekyll-sitemap

# Updates the last_modified_at for all the files where we have the dates - we can't do it
# through the last_modified_at plugin because https://github.com/jekyll/jekyll-sitemap#lastmod-tag
sitemap:
	@find . -type f \( -name "*.html" -o -name "*.md" \) -exec sed -i '' -e "s/last_modified_at: \".*\"/last_modified_at: \"$(shell date '+%Y-%m-%d')\"/g" {} \;
