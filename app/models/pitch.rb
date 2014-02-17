class Pitch < ActiveRecord::Base
  belongs_to :agent
  belongs_to :holiday

  enum expertise: { familiar: 0, expert: 1, specialist: 2 }
  enum status: { undecided: 0, rejected: 1, accepted: 2 }

  validates :agent, :holiday, presence: true
  validates :min, :max, numericality: { only_integer: true, greater_than: 0 }
  validate :max_is_greater_than_min


  def seen!
    unless seen?
      self.seen = true
      save
    end
  end

  def update_status!(status)
    self.status = status
    save
  end
  
  private
  def max_is_greater_than_min
    errors.add(:max, "is less than minimum") if min and max and max < min
  end

end

