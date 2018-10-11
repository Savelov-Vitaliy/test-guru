class BadgesController < AuthenticatedController

  def index
    @badges = Badge.all
    users_badges = current_user.badges.map {|b| b}
    @users_badges = users_badges.uniq
    @users_badges_counts = {}
    @users_badges.map {|badge| @users_badges_counts[badge.id] = users_badges.count(badge)}
  end

end