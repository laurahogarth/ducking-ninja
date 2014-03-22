module Features
  module Decoration

    def decorate!(resource)
      raise ArgumentError unless resource.is_a?(Symbol)
      instance_variable_set(resource, instance_variable_get(resource).decorate)
    end

  end
end
