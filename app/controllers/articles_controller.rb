class ArticlesController < ApplicationController
  
   def view
    @article = Article.all
    end
  
  def create
    @user = User.find_by_user_name(session[:user_id])
    @article = Article.new do |a|
      a.art_title = params[:article][:art_title]
      a.description = params[:article][:description]
      a.user_id = @user.id
    end
    respond_to do |format|
      if @article.save
         format.html {redirect_to("/", :notice => 'Article created successfully')}
         format.xml {render :xml => @article, :status => :created, :location => @article }
      else
         format.html {render :action => "new"}
         format.xml {render :xml => @article.errors, :status => :unprocessable_entry }
      end
    end
  end

  def new
    @article = Article.new
        
  end

  def show
    if session[:user_id]
      @article = Article.where(:id => params[:id]).first
      @article.count = @article.count + 1
      @article.save 
      respond_to do |format|
        format.html # view.html.erb
        format.xml  { render :xml => @article }
      end
    else
        check
    end
  end

  def delete_article
    
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :controller => 'articles', :action => 'index'
    
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
    @article1 = Article.order(:'created_at desc')
      @article2 = Article.order(:'count desc')
    #find(:all, :order => "updated_at")    
  end
  
  def search
    aa
  end

  def link_check
      if session[:user_id]== Article.user_id
        equal
      else
        notequal
      end
  end
  
  def check
    if User.find_by_id(session[:user_id])
      
    else
      redirect_to login_users_path
    end
  end
  
end
