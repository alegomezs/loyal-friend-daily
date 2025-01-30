# Enable multiple modules
# drush en devel admin_toolbar -y

# Set default theme
# drush config-set system.theme default loyal_friend -y

# Install theme dependencies.
cd /web/themes/loyal_friend
npm install sass --save-dev

# Clear all caches
drush cr

# Enable development mode (disables render cache, page cache, etc.)
drush config:set system.performance cache.page_max_age 0 -y
drush config:set system.performance css.preprocess 0 -y
drush config:set system.performance js.preprocess 0 -y
