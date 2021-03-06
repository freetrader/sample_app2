class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit,:update,:index, :destroy]
  before_filter :correct_user, :only => [:edit,:update]
  before_filter :admin_user, :only => :destroy
  
  def destroy
    if current_user.admin
      user = User.find(params[:id])
      if user != current_user
        user.destroy
        flash[:success] = "User destroyed."
      else
        flash[:error] = "Suicide is immoral."
      end
        
      redirect_to users_path
    end
  end
  
  def index
    @title = "All users"
    #@users = User.all
    @users = User.paginate(:page => params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
 
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
 
    #if signed_in?
      
     # flash[:error]="you already have an account"
      #redirect_to root_path
    #else
      
      @user = User.new(params[:user])
 
      if @user.save
        sign_in @user
        redirect_to @user, :flash => {:success=>"Welcome to the Sample App!"}  
      else
        @title = "Sign up"
        render 'new'
      end
    # end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      #it worked
      redirect_to @user, :flash => {:success=>"User updated"}
    else
        @title = "Edit user"
        render 'edit'
    end 
            
    
  end
  
  private 
  
    def authenticate
       deny_access unless signed_in?
    end
    
    def signed_in_and_go_home
       deny_access if signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id]) 
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
      
    end
 
end
