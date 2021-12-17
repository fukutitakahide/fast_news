class User < ApplicationRecord
  
  validates :name,{presence: true,length:{maximum: 10}}
  validates :password,{presence: true, length:{minimum: 4,maximum: 8}}
  validates :name, uniqueness: true
  
  attr_accessor :like
  
  validates :like, present_like: true 
end
