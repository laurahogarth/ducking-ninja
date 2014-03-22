
# Monkey patch the collecion decorator class to allow kaminari pagination to occur
# on ALL decorated models.

module Draper
  class CollectionDecorator
    delegate :current_page, :total_pages, :limit_value
  end
end
