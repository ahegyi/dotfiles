class Dotfiles < Thor
  include Thor::Actions
  Thor::Sandbox::Dotfiles.source_root(File.expand_path('..', __FILE__))
  @user = %x[whoami].chomp

  desc "install", "Install all dotfiles into #{@user}'s home directory"
  method_options :force => :boolean
  def install
    Dir['*'].each do |file|
      next if [
        "Gemfile",
        "Gemfile.lock",
        "Thorfile",
        "README.md",
        "LICENSE.md",
        "fish",
        "Package Control.sublime-settings",
        "Preferences.sublime-settings"
      ].include?(file)
      link_file(file, "~#{@user}/.#{file}", options[:force])
    end
    link_file("#{Dir.pwd}/fish/config.fish", "~#{@user}/.config/fish/config.fish", options[:force])
    link_file("#{Dir.pwd}/fish/functions", "~#{@user}/.config/fish/functions", options[:force])
    link_file(
      "#{Dir.pwd}/Package Control.sublime-settings",
      "~#{@user}/Library/Application Support/Sublime Text 2/Packages/User/Package Control.sublime-settings",
      options[:force]
    )
    link_file(
      "#{Dir.pwd}/Preferences.sublime-settings",
      "~#{@user}/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings",
      options[:force]
    )
  end
end
