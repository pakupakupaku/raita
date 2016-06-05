# Raita

## Setup

```sh
# development
bundle install
bin/rake db:create
bin/rake db:migrate
bin/rake s

# test
bin/rake db:create RAILS_ENV=test
bin/rake db:migrate RAILS_ENV=test
bin/rake spec
bin/rspec spec/controllers/pages_controller_spec.rb
```
