require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  install_oh_my_zsh
  switch_to_zsh
  install_tmux_themes
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md oh-my-zsh config gconf/*]
  files << "oh-my-zsh/custom/max.zsh-theme"
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
  install_vundler
  install_config
  install_gconf
  make_vim_tmp_dir
  update_font_cache
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
      puts "installing oh-my-zsh syntax Highlighting..."
      system %Q{mkdir ~/.oh-my-zsh/custom/plugins}
      system %Q{git clone git://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def install_vundler
  if File.exist?(File.join(ENV['HOME'], "/dotfiles/vim/bundle/vundle"))
    puts "found ~/vim/bundle/vundle"
  else
    puts "installing Vundle"
    system %Q{git clone https://github.com/gmarik/vundle.git ~/dotfiles/vim/bundle/vundle}
  end
end

def update_font_cache
  puts "updating font  cache"
  puts "---------------------------"
  system %Q{fc-cache -vf ~/.fonts}
  puts "---------------------------"
  puts "font cache updated"
end

def install_tmux_themes
  if File.exist?(File.join(ENV['HOME'], "/.tmux/themes"))
    puts "found ~/.tmux/themes"
  else
    puts "installing tmux themes"
    system %Q{git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux/themes}
  end
end

def make_vim_tmp_dir
  if !File.exists?(File.join(ENV['HOME'],".vim/tmp"))
    system %Q{mkdir -p "$HOME/.vim/tmp"}
    puts "created dir ~/.vim/tmp for vim swap files"
  else
    puts "found dir ~/.vim/tmp for vim swap files"
  end
end

def install_config
  replace_all = false
  configfiles = Dir['config/*']
  if !File.exists?(File.join(ENV['HOME'],".config"))
    system %Q{mkdir -p "$HOME/.config/."}
  end
  configfiles.each do |file|
    system %Q{mkdir -p "$HOME/.config/#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def install_gconf
  replace_all = false
  gconffiles = Dir['gconf/*']
  if !File.exists?(File.join(ENV['HOME'],".gconf/apps"))
    system %Q{mkdir -p "$HOME/.gconf/apps/."}
  end
  gconffiles.each do |file|
    system %Q{mkdir -p "$HOME/.gconf/apps/#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end
