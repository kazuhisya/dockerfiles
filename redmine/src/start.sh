#!/bin/bash

if [ ! -e /var/lib/redmine/data/production.sqlite3 ]; then
    # first
    echo "=== Start first setup ==="
    NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
        bundle install --without development test --path vendor/bundle -j${NPROC}
    bundle exec rake generate_secret_token
    RAILS_ENV=production bundle exec rake db:migrate
    RAILS_ENV=production REDMINE_LANG=ja bundle exec rake redmine:load_default_data
    RAILS_ENV=production bundle exec rake redmine:plugins:migrate
    echo "=== first setup done ==="
else
    # next
    echo "=== Start upgrade setup ==="
    NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
        bundle install --without development test --path vendor/bundle -j${NPROC}
    bundle exec rake generate_secret_token
    RAILS_ENV=production bundle exec rake db:migrate
    RAILS_ENV=production bundle exec rake redmine:plugins:migrate
    bundle exec rake tmp:cache:clear tmp:sessions:clear
    echo "=== upgrade done ==="
fi

echo "--- start unicorn service ---"
RAILS_ENV=production bundle exec  unicorn_rails -l 3000

