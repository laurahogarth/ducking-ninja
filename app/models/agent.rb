class Agent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :agent_detail
  has_many :favourite_countries
  has_many :pitches

  accepts_nested_attributes_for :agent_detail

  def to_s
    agent_detail ? agent_detail.name : email
  end

end
