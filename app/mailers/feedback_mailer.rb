class FeedbackMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) },
        from: 'notification@testguru.com'

  before_action :set_current_user

  def feedback(feedback_params)
    @subject = feedback_params[:subject]
    @message = feedback_params[:message]
    mail subject: I18n.t('mailers.feedback_mailer.feedback_mail_title', user_name: @current_user.full_name)
  end

  private

  def set_current_user
    @current_user = User.find(params[:current_user_id])
  end

end
