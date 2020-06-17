class ApartmentsController < ApplicationController
  # add controller methods
  set :views, "app/views/apartments"

  get '/apartments' do
    @apartments = Apartment.all
    erb :index
  end

  get '/apartments/create' do
    erb :new
  end

  get '/apartments/:id' do
    @apartment = Apartment.find(params[:id])
    erb :show
  end

  post '/apartments' do
    apt = Apartment.create(address: params[:address])
    redirect "/apartments/#{apt.id}" 
  end

  delete '/apartments/:id' do
    apartment = Apartment.find(params[:id])
    apartment.destroy 
    redirect '/apartments' 
  end

end