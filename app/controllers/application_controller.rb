class ApplicationController < Sinatra::Base

  set :default_content_type ,'application/json'

  get '/bakeries' do
    bakeries = Bakery.all 
    bakeries.to_json
  end

  get '/bakeries/:id' do
    single_bakery = Bakery.find(params[:id])
    single_bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked = BakedGood.all.order("price DESC")
    baked.to_json
  end

  get '/baked_goods/most_expensive' do
     priced = BakedGood.all.order("price DESC").limit(1).first
     priced.to_json
  end

end
