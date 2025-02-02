# Enable multiple modules
# Set default theme
drush config-set system.theme default loyal_friend -y

# Install theme dependencies.
ddev ssh
cd web/themes/custom/loyal_friend/
npm install sass --save-dev
exit

# Enable development mode (disables render cache, page cache, etc.)
drush config:set system.performance cache.page_max_age 0 -y
drush config:set system.performance css.preprocess 0 -y
drush config:set system.performance js.preprocess 0 -y

# Enable Twig debug mode
drush php:eval "\Drupal::keyValue('development_settings')->setMultiple(['disable_rendered_output_cache_bins' => TRUE, 'twig_debug' => TRUE, 'twig_cache_disable' => TRUE]);"

# Clear all caches
drush cr