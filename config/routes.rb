Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'hello/index' => 'hello#index' # トップページ
  root 'hello#index'
  get 'hello/link' => 'hello#link'
  get 'tweets/cat' => 'tweets#cat' # ネコ種紹介ページ
  get 'tweets/rank' => 'tweets#rank' # 投稿詳細ページ（いいねが多い順）
  resources :tweets do # 投稿関連ページ
    resources :likes, only: [:create, :destroy] # いいね
    resources :comments, only: [:create] # コメント
  end

  get 'maps/index'
  resources :maps, only: [:index]

end
