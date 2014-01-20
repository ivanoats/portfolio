module ApplicationHelper

  # translate the rails flash levels to appropriate twitter bootstrap css classes
  def flash_class(level)
    case level
      when :notice then "alert-box"
      when :success then "alert-box success"
      when :error then "alert-box error"
      when :alert then "alert-box warning"
    end
  end
end
