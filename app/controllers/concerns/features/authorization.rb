module Features
  module Authorization

    def current_user
      return current_agent if agent_signed_in? 
      return current_traveller if traveller_signed_in?
      nil
    end

  end
end
