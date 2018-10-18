class BadgesController < AuthenticatedController

  def index
    @badges = Badge.all
    users_badges = current_user.badges.to_enum
    @users_badges = users_badges.uniq
    @users_badges_counts = @users_badges.each_with_object({}) { |badge, counts|
      counts[badge.id] = users_badges.count(badge)
    }
  end

end