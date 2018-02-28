working_directory "/var/www/unit/vagrant/graphql-sinatra-sample"

worker_processes 2
timeout 300

listen "/tmp/unit-vagrant.socket"
pid "/run/unicorn/unit-vagrant.pid"

stdout_path "/var/log/www/unit/vagrant/unicorn.stdout.log"
stderr_path "/var/log/www/unit/vagrant/unicorn.stderr.log"
