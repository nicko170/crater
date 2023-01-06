export PATH=$PATH:$HOME/vendor/bin:$HOME/.heroku/php/bin
until nc -z $DB_HOST $DB_PORT; do sleep 5; echo "Waiting for DB to come up... ($DB_HOST:$DB_PORT)"; done

### This is a hack to allow passport to initialize.
php artisan passport:install --force

# Run migrations
php artisan migrate --force
