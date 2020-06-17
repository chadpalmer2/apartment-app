class TenantsController < ApplicationController
  # add controller methods
  set :views, "app/views/tenants" 

  get '/tenants' do
    @tenants = Tenant.all
    erb :index
  end

  get '/tenants/create' do
    @apartments = Apartment.all 
    erb :new
  end

  post '/tenants' do
    tenant = Tenant.create(name: params[:name])

    if params[:apartment_address] == "" 
      tenant.update(apartment_id: params[:apartment_id])
    else
      apt = Apartment.create(address: params[:apartment_address]) 
      tenant.update(apartment_id: apt.id) 
    end
    tenant.save 

    redirect "/tenants/#{tenant.id}"
  end

  delete "/tenants/:id" do 
    tenant = Tenant.find(params[:id]) 
    tenant.destroy 
    redirect '/tenants'  
  end 

  get '/tenants/:id' do 
    @tenant = Tenant.find(params[:id]) 
    erb :show 
  end 

  get '/tenants/:id/edit' do 
    @tenant = Tenant.find(params[:id]) 
    @apartments = Apartment.all 
    erb :edit 
  end 

  patch '/tenants/:id' do 
    @tenant = Tenant.find(params[:id]) 
    @tenant.update(name: params[:name])  
    if params[:apartment_address] == "" 
      @tenant.update(apartment_id: params[:apartment_id])
    else
      apt = Apartment.create(address: params[:apartment_address]) 
      @tenant.update(apartment_id: apt.id) 
    end
    @tenant.save 

    redirect "/tenants/#{@tenant.id}"
  end 



end 