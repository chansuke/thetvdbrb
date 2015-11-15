class ThetvdbGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
  def create_initializer_file
    copy_file "thetvdbrb.rb", "config/initializers/thetvdbrb.rb"
  end
end
