module MessagesHelper
  def render_message_content(message)
    simple_format(message.content)
  end

  def render_message_created_at(message)
    message.created_at.strftime("%F %H:%M")
  end
end
