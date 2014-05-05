class DealsController < ApplicationController

#load_and_authorize_resource

def index
@deals = Deal.all
#@val = member_signed_in?
end

def show
@deal = Deal.find(params[:id])
end

def edit
if member_signed_in? 
 @deal = Deal.find(params[:id])
 if  @deal.member_id != current_member.id
  flash.alert = "You are not authorized to edit this deal"
  redirect_to root_path
 end
else
 flash.notice = "Please login to make changes to the deal"
 redirect_to root_path
#authorized! if can? :edit, @deal
end
end

def update
 @deal = Deal.find(params[:id])
 
  if @deal.update_attributes(params[:deal])
   redirect_to mydeals_path
  else
    render 'edit'
  end
end

def new
 if member_signed_in?
  @deal = Deal.new
 else
  flash.notice = "Please login to create Deals" 
  redirect_to root_path
 end
 @deal = Deal.new
end

def destroy
 @deal = Deal.find(params[:id])
 @deal.destroy
 
 redirect_to mydeals_path
end

def create
 @deal = Deal.new(params[:deal])
 @deal.member_id = current_member.id
 if  @deal.save
  redirect_to mydeals_path
 else
  render 'new'
 end
end

def searchdealsresult
 @dt= params[:dealssearchparam][:date]
 @typ = params[:dealssearchparam][:dealtype]
 @loc = params[:dealssearchparam][:location]

 if @dt.blank? or @typ.blank? or @loc.blank?
  flash.alert ='Please specify the date,type and location'
  render 'search'
  return
 end

 @gh=Date.parse @dt
 @deals =Deal.where("(date(startdate) <= date(?)  AND date(enddate) >=date(?)) AND dealtype = ? AND location = ?",@gh,@gh,@typ,@loc)
end

def mine
	#raise "Unknown" 
if member_signed_in?
 @deals = Deal.where(:member_id => current_member.id)
else
 redirect_to root_path
end
#@deal =  Deal.where(:member_id => current_member.id)
 #render 'deals/mine' 
	#render :action => "mine"
end

def search
end


end
