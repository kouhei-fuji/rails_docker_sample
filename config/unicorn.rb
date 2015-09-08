RAILS_ROOT = File.expand_path('../..', __FILE__)

worker_processes 1
working_directory RAILS_ROOT

listen "#{RAILS_ROOT}/tmp/sockets/unicorn.sock"

timeout 30

pid "#{RAILS_ROOT}/tmp/pids/unicorn.pid"

stderr_path '/dev/stderr'
stdout_path '/dev/stdout'

preload_app true

check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
