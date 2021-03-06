class FeedbackController < ApplicationController

  def new
  end

  def create
    flash_options = if FeedbackMailer.with(current_user_id: current_user.id).feedback(feedback_params).deliver_now
      { notice: I18n.t('mailers.feedback_mailer.success') }
    else
      { alert:  I18n.t('mailers.feedback_mailer.failure') }
    end
    redirect_to new_feedback_url, flash_options
  end

  private

  def feedback_params
    params.permit(:subject, :message)
    { subject: params[:subject], message: params[:message] }
  end

end
