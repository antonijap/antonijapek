###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
	activate :livereload
end

activate :blog do |blog|
	blog.prefix = "portfolio"
	blog.permalink = "/{title}"
	blog.sources = "{title}.html"
	blog.name = "portfolio"
	blog.layout = "layouts/portfolio-item"
end

activate :directory_indexes

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
	def breadcrumbs(page)
		hierarchy = [page]
		hierarchy.unshift hierarchy.first.parent while hierarchy.first.parent
		hierarchy.collect {|page| link_to page.data.title, "/#{page.path}" }.join(h ' / ')
	end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end


# activate :deploy do |deploy|
#   deploy.deploy_method = :rsync
#   deploy.host          = 'antonijapek.com'
#   deploy.path          = '/home/antonija/public_html/dev'
#   deploy.user  = 'antonija' # no default
#   deploy.port  = 21098  # ssh port, default: 22
#   deploy.clean = true # remove orphaned files on remote host, default: false
#   # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
# end
