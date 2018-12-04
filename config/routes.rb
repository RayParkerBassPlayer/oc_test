Rails.application.routes.draw do
  get "/shingles/(:shingle)/(:color)", :to => "home#shingles", :as => :shingles

  root :to => "home#shingles"
end
