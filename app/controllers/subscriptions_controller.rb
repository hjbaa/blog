class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def change_subscription_status
    @blogger = User.find(params[:id])
    @follower = current_user

    if @follower.subscribed_at?(@blogger)
      Subscription.find_by(follower_id: @follower.id, followed_blogger_id: @blogger.id).destroy
    else
      Subscription.create(follower: @follower, followed_blogger: @blogger)
    end
  end
end
