module ApplicationHelper
  def flash_messages
    flash_types = { success: "success", error: "danger", alert: "warning", notice: "info" }

    alerts =
      flash.map do |msg_type, message|
        alert_content = message
        flash_type    = flash_types[msg_type.to_sym] || msg_type
        alert_class   = "alert alert-#{flash_type} alert-dismissible"

        content_tag(:div, alert_content, class: alert_class, role: 'alert')
      end

    alerts.join("\n").html_safe
  end

  def sign_in_with_provider
    provider = Rails.env.development? ? 'developer' : ''
    link_to "#{provider.capitalize} sign in", user_developer_omniauth_authorize_path, class: "btn btn-info"
  end
end
