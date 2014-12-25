Rails.application.routes.draw do
  devise_for :users                        # 会員登録・ログイン・ログアウト
  root 'photos#index'                      # ルートパスの設定
  get 'photos'      => 'photos#index'      # マイページ(写真一覧画面)（photos: コントローラー名、index: アクション名）
  get 'photos/new'  => 'photos#new'        # 写真投稿ページ
  post 'photos'     => 'photos#create'     # 写真投稿機能
  # トップページ

end