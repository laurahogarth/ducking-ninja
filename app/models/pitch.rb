class Pitch < ActiveRecord::Base
  belongs_to :agent
  belongs_to :holiday
end
