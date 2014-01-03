module ApplicationHelper

  def define_fields(field)
    html = ""
    html << "<div class='field'>"
    html << "<label for='profile_#{field}'>#{field}</label> <br />"
    html << "<input id='profile_#{field}' name='profile[#{field}]' size='30' type='text' value='#{@profile.send(field)}' />"
    html << "</div>"

  end
  def dynamic_define_fields(arr)
    html = ""
    arr.each do |field|
      html << define_fields(field)
    end
    raw html
  end
end
