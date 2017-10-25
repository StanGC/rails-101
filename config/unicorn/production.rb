listen "/home/apps/rails-101/shared/tmp/unicorn.sock"

worker_processes 2

# pid needs absolute path
pid "/home/apps/rails-101/shared/tmp/pids/unicorn.pid"

stderr_path "log/unicorn.stderr.log"
stdout_path "log/unicorn.stdout.log"
