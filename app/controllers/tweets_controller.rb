class TweetsController < ApplicationController

    before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]

    def index # 投稿一覧 新着順
        # 検索機能 本文（body）の単語検索
        if params[:search] == nil
            @tweets = Tweet.all
        elsif params[:search] == ''
            @tweets = Tweet.all
        else
            @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%')
        end
        @tweets = Tweet.all.page(params[:page]).per(5).order(created_at: :desc)
    end

    def rank # 投稿一覧 いいね数順にソート
        if params[:search] == nil
            @rank_tweets = Tweet.all
        elsif params[:search] == ''
            @rank_tweets = Tweet.all
        else
            @rank_tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%')
        end
        @rank_tweets = Tweet.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        @rank_tweets = Kaminari.paginate_array(@rank_tweets).page(params[:page]).per(5)
    end

    def new # 新規投稿
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new(tweet_params)
        tweet.user_id = current_user.id
        if tweet.save
            redirect_to :action => "index" # 新規投稿が保存出来たら投稿一覧へ
        else
            redirect_to :action => "new" # 保存できなかったら新規投稿ページへ戻る
        end
    end

    def show # 投稿詳細 コメント機能付き
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
    end

    def edit # 投稿編集
        @tweet = Tweet.find(params[:id])
    end

    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
            redirect_to :action => "show", :id => tweet.id # 編集内容が保存出来たら該当の投稿詳細へ
        else
            redirect_to :action => "new" # 保存できなかったら新規投稿ページへ戻る
        end
    end

    def destroy # 投稿削除
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index # 実行後投稿一覧へ
    end

    def cat # ネコ種紹介ページ用
    end

    private
    def tweet_params # パラメータ設定
        params.require(:tweet).permit(:body, :image, :video, :lat, :lng, :city)
    end

end