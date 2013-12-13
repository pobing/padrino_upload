source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'
gem 'bcrypt-ruby'
# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'
gem 'json','~>1.8.1'
# Component requirements
gem 'slim'
gem 'mongoid', '~>3.0.0'
gem 'carrierwave','0.9.0', :require => 'carrierwave'
gem 'carrierwave-mongoid','0.6.3'
gem "mini_magick", "~> 3.6.0"
# Test requirements
gem 'sinatra-contrib', '~> 1.4.1'

gem 'omniauth'
gem 'omniauth-weibo-oauth2'
# gem "omniauth-qq", "~> 0.3.0"


# Padrino Stable Gem
gem 'padrino' #, '0.11.3'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.11.3'
# end
group :development do
  gem 'rack-test', '~> 0.6.2'
  gem 'pry', '~> 0.9.10' # https://github.com/pry/pry
  gem 'pry-nav', '~> 0.2.3' # https://github.com/nixme/pry-nav
end