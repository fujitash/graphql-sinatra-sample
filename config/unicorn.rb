 sinatra_root = "/home/vagrant/helloworld"

 worker_processes 2 # CPUのコア数に揃える
 working_directory sinatra_root

 timeout 300
 listen "#{sinatra_root}/tmp/nginx-unicorn.socket" # socketを指定してnginxと連携

 pid "#{sinatra_root}/tmp/pids/unicorn.pid" # pidを保存するファイル(場所は要検討。現状は仮)
 # unicornは標準出力には何も吐かないのでログ出力を忘れずに
 stderr_path "#{sinatra_root}/log/unicorn.stderr.log"
 stdout_path "#{sinatra_root}/log/unicorn.stdout.log"
