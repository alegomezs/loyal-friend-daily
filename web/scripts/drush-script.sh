# Enable multiple modules

# Installing neccesary themes and set default theme
composer require 'drupal/bootstrap5:^4.0'
drush theme:install bootstrap5
drush theme:install loyal
drush config-set system.theme default loyal -y

# Install theme dependencies.
ddev ssh
cd web/themes/custom/loyal/
npm install sass --save-dev
exit

# Enable development mode (disables render cache, page cache, etc.)
drush config:set system.performance cache.page_max_age 0 -y
drush config:set system.performance css.preprocess 0 -y
drush config:set system.performance js.preprocess 0 -y

# Clear all caches
drush cr