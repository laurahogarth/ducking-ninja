module Features
  module SortableTable
  ###################
  # SORTABLE COLUMNS
  ###################

  private
  def sort_conditions
    if(params[:sort_column] && params[:sort_order] && ["asc","desc"].include?(params[:sort_order]))
      return params[:sort_column].to_sym => params[:sort_order].to_sym  
    else
      return nil
    end
  end
end
end
