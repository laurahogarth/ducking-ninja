module Features
  module Authentication

    def after_sign_in_path_for(user)
      if user.is_a? Traveller
        return holidays_url
      elsif user.is_a? Agent
        return agent_root_url
      else
        super
      end
    end

  end
end
