gem 'rails3-generators'

if yes?("Install jammit?", :yellow)
  gem 'jammit'

  create_file "config/assets.yml" do
    "package_assets: on\n" +
    "embed_images: off\n\n" +
    "javascripts:\n" +
    "  application:\n" +
    "    - public/javascripts/jquery/jquery.min.js\n" +
    "    - public/javascripts/jquery/jquery.metadata.js\n" +
    "    - public/javascripts/rails.js\n" +
    "    - public/javascripts/application.js\n\n" +
    "stylesheets:\n" +
    "  application:\n" +
    "    - public/stylesheets/reset.css\n"
  end

  @use_jammit = true
end

if yes?("Install haml?", :yellow)
  gem 'haml'

  inject_into_file "config/application.rb", :after => "config.generators do |generator|\n" do
    (" " * 6) + "generator.template_engine :haml\n"
  end

  @use_haml = true
end