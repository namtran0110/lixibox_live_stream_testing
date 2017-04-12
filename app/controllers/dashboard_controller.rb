class DashboardController < ApplicationController
  def show
    unless current_user
      flash[:error] = "You must login to view Dashboard"
      redirect_to user_session_path
    else
      @user = current_user
      @categories = Category.all
      non_empty_stores = Store.joins(:products).group('stores.id')

      @stores = non_empty_stores.where.not(user_id: @user.id)
      @streaming_stores = Store.where.not(user_id: @user.id, streaming_now: false)

      my_follows = Follow.where(follower_id: @user.id)
      my_followed_users = User.find(my_follows.map(&:following_id))
      @subscribed_stores = []
      my_followed_users.each do |user|
        @subscribed_stores.push(user.store)
      end

      #other stores which are not in the first two lists
      @other_stores = @stores - (@subscribed_stores + @streaming_stores)


      #for seller dashboard
      @available_products = current_user.store.products
    end
  end
end
