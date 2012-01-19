set :application, "set your application name here"
set :repository,  "git@github.com:mackshkatz/qlap-weblog.git"

set :scm, "git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :branch, "master"

role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

ssh_options[:forward_agent] = true
# Since I was using my own private keys for git, this tells
# Capistrano to use my local keys instead of keys installed
# on the server; known was agent forwarding.

set :deploy_via, :remote_cache
# Turns on remote caching, which keeps a local git repo
# on the server you're deploying to, and simply runs
# a fetch from that rather than an entire clone.



# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end