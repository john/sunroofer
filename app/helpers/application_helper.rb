module ApplicationHelper
  
  # Modified from humane_flash_messages to escape HTML in message content.
  def escaped_humane_flash_messages
    content = ""
    unless flash[:notice].blank?
      content << javascript_tag("humane.notice(\"#{escape_javascript(html_escape flash[:notice])}\");")
    end
    unless flash[:error].blank?
      content << javascript_tag("humane.error(\"#{escape_javascript(html_escape flash[:error])}\");")
    end
    unless flash[:alert].blank?
      content << javascript_tag("humane.alert(\"#{escape_javascript(html_escape flash[:alert])}\");")
    end
    content
  end
  
end
