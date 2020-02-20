# SHOP README

 I guess you only need to see some code. Not best solution for a cart, maybe acts_as_shopping_cart was enought.
 There are nice solutions allready implemented like effective_orders or even spree. 

* Ruby version 2.6.0 and Rails 6.0.2.1

* Database creation
  Sqlite3 databate for development.

* Database initialization
  rails db:migrate
  rails db:seed     # Seed some Faker products

* How to run the test suite
  rake test         # Some test

* Sessions
  Cart id saved in session expires after 10 min by cron or when user comes back.
  Cron task to delete expired carts:
    $ whenever --update-crontab    # Write crontab file from config/schedule.rb 
    $ crontab -l                   # list cron

* Api endpoints (see shop.postman_collection.json)
