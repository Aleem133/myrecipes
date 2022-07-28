# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

==================
if you want to brush up skills on html and css go to: learn.shayhowe.com and take course 101
=======================
restful routes

recipes         GET    /recipes(.:format)                recipes#index
                POST   /recipes(.:format)                recipes#create
new_recipe      GET    /recipes/new(.:format)            recipes#new
edit_recipe     GET    /recipes/:id/edit(.:format)       recipes#edit
recipe          GET    /recipes/:id(.:format)            recipes#show
                PATCH  /recipes/:id(.:format)            recipes#update
                PUT    /recipes/:id(.:format)            recipes#update
                DELETE /recipes/:id(.:format)            recipes#destroy
