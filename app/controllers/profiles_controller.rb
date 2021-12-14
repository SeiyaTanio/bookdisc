class ProfilesController < ApplicationController

  private
    def profile_params
      params.require(:profile).permit(:favorite_book, :self_introduction).merge(user_id: current_user.id)
    end
end
