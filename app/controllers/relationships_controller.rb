class RelationshipsController < ApplicationController
  def follow_user
    @user = User.find_by username: params[:username]
    begin
      current_user.follow @user.id
    rescue => e
      puts e.message
    end
    redirect_to dashboard_path
  end

  def unfollow_user
    @user = User.find_by username: params[:username]
    current_user.unfollow @user.id
    redirect_to dashboard_path
  end
end
