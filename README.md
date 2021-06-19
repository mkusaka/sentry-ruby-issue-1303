# sentry-ruby-issue-repro

# how to reproduce
1. clone
2. setup

```bash
bundle install
echo 'https://public@example.com/project-id' > .env
bundle exec rails db:setup
bundle exec rails s
open localhost:3000/docs/new
```

3. create new docs with non-ascii string, then issue 1303 error occurred. (Runtime error occurred at controller, but error cannot report to sentry server.)
  - For example, title: `あ`, content: `a`

# example stack traces
```
Event sending failed: "\xE3" from ASCII-8BIT to UTF-8
/Users/username/.rbenv/versions/2.7.3/lib/ruby/2.7.0/json/common.rb:224:in `generate'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/2.7.0/json/common.rb:224:in `generate'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/sentry-ruby-core-4.5.1/lib/sentry/transport.rb:102:in `encode'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/sentry-ruby-core-4.5.1/lib/sentry/transport.rb:42:in `send_event'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/sentry-ruby-core-4.5.1/lib/sentry/client.rb:86:in `send_event'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/sentry-ruby-core-4.5.1/lib/sentry/client.rb:110:in `block in dispatch_background_event'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/sentry-rails-4.5.1/lib/sentry/rails/background_worker.rb:7:in `block (2 levels) in perform'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/activerecord-5.2.6/lib/active_record/connection_adapters/abstract/connection_pool.rb:416:in `with_connection'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/sentry-rails-4.5.1/lib/sentry/rails/background_worker.rb:6:in `block in perform'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/concurrent-ruby-1.1.9/lib/concurrent-ruby/concurrent/executor/ruby_thread_pool_executor.rb:363:in `run_task'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/concurrent-ruby-1.1.9/lib/concurrent-ruby/concurrent/executor/ruby_thread_pool_executor.rb:352:in `block (3 levels) in create_worker'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/concurrent-ruby-1.1.9/lib/concurrent-ruby/concurrent/executor/ruby_thread_pool_executor.rb:335:in `loop'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/concurrent-ruby-1.1.9/lib/concurrent-ruby/concurrent/executor/ruby_thread_pool_executor.rb:335:in `block (2 levels) in create_worker'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/concurrent-ruby-1.1.9/lib/concurrent-ruby/concurrent/executor/ruby_thread_pool_executor.rb:334:in `catch'
/Users/username/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/concurrent-ruby-1.1.9/lib/concurrent-ruby/concurrent/executor/ruby_thread_pool_executor.rb:334:in `block in create_worker'
RuntimeError (test exception):
Unreported Event: RuntimeError: test exception
```
