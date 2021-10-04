class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "登録が完了しました。"
        redirect_to @user
      else
        render("users/new")
      end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "登録内容を更新しました"
      redirect_to @user
    else
      @error_message = "名前またはパスワードが間違っています"
      render('edit')
    end
    
  end
  
  def login
    @user = User.find_by(password: params[:password],name: params[:name])
      if @user
        session[:user_id] = @user.id
        flash[:notice] = "ログインしました"
        redirect_to @user
      else
        @error_message = "名前またはパスワードが間違っています"
        @name = params[:name]
        @password = params[:password]
        render("users/login_form")
      end
  end

  def login_form
    @user = User.new
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def show
    @user = User.find_by(id: params[:id])
    
    agent = Mechanize.new                  
      localpage = agent.get("https://news.yahoo.co.jp/categories/local") 
      lifepages = agent.get("https://news.yahoo.co.jp/categories/life")
      sciencepages = agent.get("https://news.yahoo.co.jp/categories/science")
      itpages = agent.get("https://news.yahoo.co.jp/categories/it")
      sportspages = agent.get("https://news.yahoo.co.jp/categories/sports")
      entertainmentpages = agent.get("https://news.yahoo.co.jp/categories/entertainment")
      economypages = agent.get("https://news.yahoo.co.jp/categories/business")
      
      @local_img = localpage.search('.yjnSub_list_thumbnail img')
      @local_text = localpage.search('.yjnSub_list_item p')
      @local_url = localpage.search('.yjnSub_list_item a')
      @life_img = lifepages.search('.yjnSub_list_thumbnail img')
      @life_text = lifepages.search('.yjnSub_list_item p')
      @life_url = lifepages.search('.yjnSub_list_item a')
      @science_img = sciencepages.search('.yjnSub_list_thumbnail img')
      @science_text = sciencepages.search('.yjnSub_list_item p')
      @science_url = sciencepages.search('.yjnSub_list_item a')
      @it_img = itpages.search('.yjnSub_list_thumbnail img')
      @it_text = itpages.search('.yjnSub_list_item p')
      @it_url = itpages.search('.yjnSub_list_item a')
      @sports_img = sportspages.search('.yjnSub_list_thumbnail img')
      @sports_text = sportspages.search('.yjnSub_list_item p')
      @sports_url = sportspages.search('.yjnSub_list_item a')
      @entertainment_img = entertainmentpages.search('.yjnSub_list_thumbnail img')
      @entertainment_text = entertainmentpages.search('.yjnSub_list_item p')
      @entertainment_url = entertainmentpages.search('.yjnSub_list_item a')
      @economy_img = economypages.search('.yjnSub_list_thumbnail img')
      @economy_text = economypages.search('.yjnSub_list_item p')
      @economy_url = economypages.search('.yjnSub_list_item a')
  end
  
  def destroy
     @user = User.find_by(id: params[:id])
     @us
  privateer.destroy
     session[:user_id] = nil
     flash[:notice] = "ユーザー情報を削除しました。"
     redirect_to("/")
  end

  def user_params
    params.require(:user).permit(:name,:password,:like_life_id, :like_it_id, :like_area_id, 
                                 :like_science_id, :like_sports_id, :like_entertainment_id, :like_economy_id)
  end
end