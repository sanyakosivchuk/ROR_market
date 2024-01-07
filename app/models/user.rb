class User < ApplicationRecord
  devise :database_authenticatable, :registerable, 
         :rememberable, :validatable, :recoverable
  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
end