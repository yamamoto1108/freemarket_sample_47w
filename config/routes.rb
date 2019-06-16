Rails.application.routes.draw do
  get 'test' => 'test#index'
  get 'test/mypage' => 'test#mypage', as: 'mypage'
  get 'test/mypage/profile' => 'test#profile'
  get 'test/purchase' => 'test#purchase', as: 'purchase'
  root 'test#index'
end
