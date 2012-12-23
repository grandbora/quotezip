source 'https://rubygems.org'

gem 'rails', '3.2.9'
gem 'thin'

group :production do
	gem "pg"
	gem 'newrelic_rpm'
end

group :development, :test do
	gem 'mysql'
	gem 'mysql2'
	gem 'sqlite3'
	gem 'therubyracer'
	gem 'nokogiri'
	gem 'taps'
	gem 'foreman'
end

group :assets do
	gem 'uglifier'
	gem 'nokogiri'
end