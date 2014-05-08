#!/usr/bin/env rake

task :ci => [:dump, :test]

task :dump do
  sh 'vim --version'
end

task :test do
  sh 'bundle exec vim-flavor test'
end

task :gdoc do
    sh 'html2vimdoc.py -t previous-buffer -f previous-buffer.txt README.md > doc/previous-buffer.txt'
end
