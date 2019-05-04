class SessionsController <ApplicationController

def new
end





def create
chef =Chef.find_by(email: params[:session][:email].downcase)
if chef && chef.authenticate(params[:session][:password])
flash[:seccess]="you have successfully logged in"
session[:chef_id]=chef.id
cookies.signed[:chef_id]=chef.id
redirect_to chef
else
flash.now[:danger]="There was something wrong with your login"
render 'new'

end

end


def destroy
  session[:chef_id]= nil
  flash[:success]="you have logged out"
  redirect_to root_path
end



end
