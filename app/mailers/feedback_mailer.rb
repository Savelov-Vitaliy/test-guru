class FeedbackMailer < ApplicationMailer

  before_action :set_current_user

  def feedback(admin_email, feedback_params)
    @feedback_params = feedback_params
    mail to: admin_email, subject: I18n.t('mailers.feedback_mailer.feedback_mail_title', user_name: @current_user.full_name)
  end

  private

  def set_current_user
    @current_user = User.find(params[:current_user_id])
  end

end
