class FishesController < ApplicationController
    def index
      if session[:user_id]
         @user = Fish.new
         @user.id = session[:user_id]
      end
      agent = Mechanize.new                  
      page = agent.get("https://news.yahoo.co.jp")
      
      @element_img = page.search('.yjnSub_list_thumbnail img') 
      @element_text = page.search('.yjnSub_list_item p')
      @element_url = page.search('.yjnSub_list_item a')
    end
    
    def show
        @fishes = Fish.all
    end
end
