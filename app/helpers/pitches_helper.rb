module PitchesHelper

  def expertise_level(level)
    case level
      when 2
        "Specialist"
      when 1
        "Expert"
      else
        "Familiar"
    end
  end

end
