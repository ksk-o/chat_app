Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
    #ルーティングのネスト 入れ子構造 どのルームのメッセージを見るのか、作るのかという設定
    #メッセージに結びつくルームのidの情報を含んだパスを、受け取れるようになる
  end
end