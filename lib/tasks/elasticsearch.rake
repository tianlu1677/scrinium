require 'elasticsearch/rails/tasks/import'

# how to use
# rake environment elasticsearch:import:model CLASS='Article' BATCH=100 FORCE=y
# rake environment elasticsearch:import:model
# for production
# RAILS_ENV=production rake environment elasticsearch:import:model CLASS='Article' BATCH=100 FORCE=y