class ChefsController < ApplicationController
def new
  @chef=Chef.new
end
def create
  @chef=Chef.new(chef_params)
  if @chef.save
 flash[:sucess]="welcome #{@chef.chefname} to Myrecipe App!"
 redirect_to chef_path(@chef)
    #code
  else
    render 'new'
  end

end

private
def chef_params
  params.require(:chef).permit(:chefname,:email,:password,:password_confirmation)
end
end