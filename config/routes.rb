Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get '/weakest_url' => 'products#weakest_action'
    get '/farmer_url' => 'products#farmer_action'
    get '/tien_url' => 'products#tien_action'
  end
end
