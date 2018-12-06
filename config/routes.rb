Rails.application.routes.draw do
  post "shingles/zip_updated", :to => "home#zip_updated", :as => :shingle_zip_updated
  get "/shingles/(:shingle)/(:color)", :to => "home#shingles", :as => :shingles
  get "/shingles_by_zip/:zip/(:shingle)/(:color)", :to => "home#shingles", :as => :shingles_by_zip

  root :to => "home#shingles"
end
