class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  enum roles: {member: 0,admin: 1}

  # private 
  # def default_member
  #   self.roles=member
  #   puts
  # end

end
