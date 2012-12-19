class Chat < ActiveRecord::Base
  attr_accessible :message, :user
end
