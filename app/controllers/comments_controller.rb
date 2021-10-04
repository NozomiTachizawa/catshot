class CommentsController < ApplicationController # コメント機能
    before_action :authenticate_user! # ログインしている人だけがコメント投稿可

    def create
        tweet = Tweet.find(params[:tweet_id])
        comment = tweet.comments.build(comment_params)
        comment.user_id = current_user.id
        if comment.save
            flash[:success] = "コメントしました"
            redirect_back(fallback_location: root_path)
        else
            flash[:success] = "コメントできませんでした"
            redirect_back(fallback_location: root_path)
        end
    end

    private

    def comment_params # パラメータ設定
        params.require(:comment).permit(:content)
    end

end
