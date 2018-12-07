Rails.application.routes.draw do
  post "/shingles/page_favorited", :to => "home#page_favorited", :as => :page_favorited
  post "/shingles/page_unfavorited", :to => "home#page_unfavorited", :as => :page_unfavorited
  post "/shingles/zip_updated", :to => "home#zip_updated", :as => :shingle_zip_updated
  get "/shingles/(:shingle)/(:color)", :to => "home#shingles", :as => :shingles
  get "/shingles_by_zip/:zip/(:shingle)/(:color)", :to => "home#shingles", :as => :shingles_by_zip

  namespace :admin do
    get "/reporting/shingles/all_favorites", :to => "reporting#all_favorites", :as => :shingles_all_favorites
    get "/reporting/shingles/favorite_totals", :to => "reporting#favorite_totals", :as => :shingles_favorite_totals
    get "/reporting", :to => "reporting#index", :as => :reporting
    post "/log_in", :to => "reporting#log_in", :as => :reporting_login
    get "/log_out", :to => "reporting#log_out", :as => :reporting_logout

    root :to => "reporting#index"
  end

  root :to => "home#shingles"
end
