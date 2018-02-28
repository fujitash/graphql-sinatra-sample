sinatra_root = "/home/vagrant/helloworld"
working_directory sinatra_root
# working_directory "/var/www/unit/vagrant"

worker_processes 2
timeout 300

listen "/tmp/unit-vagrant.socket"
# listen "/tmp/nginx-unicorn.socket"
pid "/run/unicorn/unit.pid"

stderr_path "/var/log/app/unicorn.stderr.log"
stdout_path "/var/log/app/unicorn.stdout.log"
# stderr_path "/var/log/www/unicorn.stderr.log"
# stdout_path "/var/log/www/unicorn.stdout.log"
