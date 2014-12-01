require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  install_prezto
  switch_to_zsh
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md config]
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
  install_plugvim
  install_config
  make_vim_tmp_dir
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

def install_prezto
  if File.exist?(File.join(ENV['HOME'], ".prezto"))
    puts "found ~/.prezto"
  else
    print "install prezto? ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing prezto"
      system %Q{git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"}
    when 'q'
      exit
    else
      puts "skipping prezto, you will need to change ~/.zshrc"
    end
  end
end

def install_plugvim
  if File.exist?(File.join(ENV['HOME'], "/dotfiles/vim/autoload/plug.vim"))
    puts "found ~/vim/autoload/plug.vim"
  else
    puts "plug.vim"
    system %Q{mkdir -p ~/.vim/autoload}
    system %Q{curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim}
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
