Rails.application.routes.draw do
  resources :users do
    post :turn_on_led, on: :collection
    post :turn_off_led, on: :collection
    post :turn_on_led_pin11, on: :collection
    post :turn_off_led_pin11, on: :collection
    post :turn_on_led_pin13, on: :collection
    post :turn_off_led_pin13, on: :collection
  end
  root 'users#index'
end
