page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

set :relative_links, true
set :haml, format: :html5, ugly: true

activate :automatic_image_sizes
activate :directory_indexes

page '/404.html', directory_index: false

page 'kaato/*', layout: :kaato
page 'seep/*', layout: :seep

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end

activate :deploy do |deploy|
  deploy.build_before  = true
  deploy.deploy_method = :git
  deploy.branch        = 'master'
end
