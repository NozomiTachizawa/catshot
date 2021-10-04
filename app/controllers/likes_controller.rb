class LikesController < ApplicationController # いいね機能

    def create # いいね
        like = current_user.likes.create(tweet_id: params[:tweet_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy # いいね削除
        like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end
end
