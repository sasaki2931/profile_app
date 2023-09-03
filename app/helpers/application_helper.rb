module ApplicationHelper


def flash_class_for(flash_type)
  case flash_type.to_sym
  when :success
    "success"
  when :error, :alert
    "danger"
  when :notice
    "info"
  else
    "info"
  end
end
end
