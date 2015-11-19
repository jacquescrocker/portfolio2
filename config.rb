require "active_support/all"

activate :bourbon

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
helpers do
  def portfolio_projects(tag = nil)
    projects = data.portfolio
    if tag
      projects = projects.select{|p| Array.wrap(p.tags).include?(tag)}
    end
    projects
  end
end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

activate :directory_indexes

# http://middlemanapp.com/blogging/
# activate :blog do |blog|
#   blog.paginate = true
#   blog.layout = "blog_layout"
#   blog.prefix = "blog"
# end

# proxy pages
ignore "/detail.html"
data.portfolio.each do |project|
  slug = project.title.parameterize
  # puts "generating project: #{project.id}"
  proxy "/#{slug}/index.html", "/detail.html", :locals => { :project => project }
end


# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
