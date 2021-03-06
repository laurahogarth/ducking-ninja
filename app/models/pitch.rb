class Pitch < ActiveRecord::Base
  belongs_to :agent
  belongs_to :holiday

  enum expertise: { familiar: 0, expert: 1, specialist: 2 }
  enum status: { undecided: 0, rejected: 1, accepted: 2 }

  validates :ref, presence: true, unless: :new_record?
  validates :agent, :holiday, presence: true
  validates :min, :max, numericality: { only_integer: true, greater_than: 0 }
  validate :max_is_greater_than_min
  validate :agent_has_not_already_pitched

  #SCOPES
  scope :seen, -> { where(seen: true) }
  scope :unseen, -> { where(seen: false) }
  scope :by_agent_for_holiday, -> (agent, holiday) { where(agent:agent, holiday:holiday) }

  #HOOKS
  after_save :generate_ref

  ###########################
  #
  # Public instance methods
  #
  ###########################

  def seen!
    self.update_attribute :seen, true unless seen?
  end

  def update_status!(new_status)
    self.update_attribute :status, new_status
  end


  ###########################
  #
  # Private instance methods
  #
  ###########################
  private
  def max_is_greater_than_min
    errors.add(:max, "is less than minimum") if min and max and max < min
  end

  def agent_has_not_already_pitched 
    errors.add(:agent_id, "You have already pitched on this holiday!") if holiday and agent and holiday.pitched_on_by? agent and self.new_record? 
  end

  def generate_ref
    self.update_attribute(:ref, "#{holiday.country.iso_2}#{DB_VERSION}#{self.id}") unless self.ref
  end

end

