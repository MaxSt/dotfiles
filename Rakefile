require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  #install_zgen
  #switch_to_zsh
  install_oh_my_fish
  install_fzf
  switch_to_fish
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md config settings]
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

def link_file_to_root(file)
  #ignore .erb files as root
  unless file =~ /.erb$/
    puts "linking /root/.#{file}"
    system %Q{[ -f /root/.zgen ] && ( sudo ln -s "$PWD/#{file}" "/root/.#{file}")}
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

def switch_to_fish
  if ENV["SHELL"] =~ /fish/
    puts "using fish"
  else
    print "switch to fish? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to fish"
      system %Q{chsh -s `which fish`}
    when 'q'
      exit
    else
      puts "skipping fish"
    end
  end
end

def install_zgen
  if File.exist?(File.join(ENV['HOME'], ".zgen"))
    puts "found ~/.zgen"
  else
    print "install zgen? ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing zgen"
      system %Q{git clone https://github.com/tarjoilija/zgen.git $HOME/.zgen}
    when 'q'
      exit
    else
      puts "skipping zgen, you will need to change ~/.zshrc"
    end
  end
end

def install_oh_my_fish
  if File.exist?(File.join(ENV['HOME'], ".oh-my-fish"))
    puts "found ~/.oh-my-fish"
  else
    print "install oh-my-fish? ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-fish"
  
      system %Q{git clone git://github.com/bpinto/oh-my-fish.git $HOME/.oh-my-fish}
    when 'q'
      exit
    else
      puts "skipping oh-my-fish"
    end
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

def install_fzf
  if !File.exists?(File.join(ENV['HOME'],".fzf"))
    puts "Installing fzf..."
    system %Q{git clone https://github.com/junegunn/fzf.git ~/.fzf}
    system %Q{~/.fzf/install}
  end
end

desc "link the dot files into root home directory"
task :linkroot do
  puts "linking dotfiles to /root/dotfiles"
  system %Q{sudo [ ! -e /root/dotfiles ] && ( sudo ln -s "$HOME/dotfiles" "/root/dotfiles")}
  puts "linking zgen to /root/.zgen"
  system %Q{sudo [ ! -e /root/.zgen ] && ( sudo ln -s "$HOME/.zgen" "/root/.zgen")}
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.md config settings]
  files.each do |file|
      link_file_to_root(file)
  end
end
