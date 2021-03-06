Rails.application.routes.draw do
  get 'omniauth/callbacks'

  devise_for :users, :controllers => {
  :sessions      => "users/sessions",
  :registrations => "users/registrations",
  :passwords     => "users/passwords",
  :omniauth_callbacks => "users/omniauth_callbacks"
  }                                        # 会員登録・ログイン・ログアウト
  root 'photos#index'                      # ルートパスの設定
  get 'photos'      => 'photos#index'      # トップページ
  get '/users/:id'  => 'users#show'        # マイページ(写真一覧画面)（photos: コントローラー名、index: アクション名）
  get 'photos/new'  => 'photos#new'        # 写真投稿ページ
  post 'photos'     => 'photos#create'     # 写真投稿機能
  # トップページ

end