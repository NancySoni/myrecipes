class ChefsController < ApplicationController

before_action :set_chef, only:[:show,:edit,:update,:destroy]
before_action :require_same_user, only:[:edit,:update,:destroy]

before_action:require_admin,only:[:destroy]

def index
@chefs=Chef.all
end




def new
@chef=Chef.new
end




def create
@chef=Chef.new(chef_params)
if @chef.save
session[:chef_id]=@chef.id
flash[:sucess]="welcome #{@chef.chefname} to Myrecipe App!"
redirect_to chef_path(@chef)
  #code
else
  render 'new'
end
end




def show
end





def edit
end




def update

if Chef.update(chef_params)
  flash[:success]="your account was updated successfully"
  redirect_to  chef_path(@chef)
else
render 'edit'
end
end



def destroy
  if !@chef.admin?
@chef.destroy
flash[:danger]="chef and all associated recipe have been deleted"
redirect_to chefs_path
  end
end


private
def chef_params
params.require(:chef).permit(:id,:chefname,:email,:password,:password_confirmation)
end

def set_chef
  @chef = Chef.find(params[:id])
end
 def require_same_user
   if current_chef != @chef and !current_chef.admin?
     flash[:danger]="you can only edit and delete your own account"
     redirect_to chefs_path
   end
 end
 def require_admin
   if logged_in? && !current_chef.admin?
     flash[:danger]="only admin user can perform that action"
     redirect_to root_path
   end
 end

end
