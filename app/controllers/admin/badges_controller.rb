class Admin::BadgesController < Admin::BaseController

  before_action :set_badge, only: %i[edit destroy update]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.save ? redirect_to_badges : render(:new)
  end

  def update
    @badge.update(badge_params) ? redirect_to_badges : render(:edit)
  end

  def destroy
    @badge.destroy
    redirect_to_badges
  end

  private

  def redirect_to_badges
    redirect_to admin_badges_path, notice: t('.notice', badge: helpers.show_badge(@badge))
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:id, :title, :color, :rule, :param)
  end

end