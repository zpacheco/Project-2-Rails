# app/models/worker.rb
class Worker < ActiveRecord::Base
  attr_accessible :name, :username, :password, :department
  has_many :worker_workshop, :dependent => :delete_all
end
