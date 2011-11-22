class UsersController < ApplicationController
  
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml=> @user}
    end
  end
  
  def users
  end
  
  def login
  end
  
  def logout
    reset_session
    redirect_to "/"
  end
  
  def verify
    @user = User.new(params[:user])
    if User.find_by_user_name_and_password(@user.user_name, @user.password)
      session[:user_id] = @user.user_name
      #id[:user_id] =@user.id
      redirect_to("/articles")# ,:notice => 'login successfull welcome ' + session[:user_id] )
    else
      flash[:notice] = "invalid username/password"
      redirect_to "/users/login"
    end
  end
  
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html {redirect_to(@user, :notice => 'User created successfully')} # redirect to main page....
        format.xml {render :xml => @user, :status => :created, :location => @user}
      else
        format.html {render :action => "new"}
        format.xml {render :xml => @user.errors, :status => :unprocessable_entry }
      end
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
  end
  
  def delete
  end
  
  def update
  end
  
  def show
    @user1 = User.where(:id => params[:id]).first
  end
  
end
