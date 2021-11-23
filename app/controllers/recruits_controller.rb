class RecruitsController < ApplicationController

   before_action :authenticate_user!,except:[:top]

   def top
   end

   def list
      @users = User.all
   end

   def index
      if params[:search] == nil
         @recruit= Recruit.all.order(created_at: :desc)
      elsif params[:search] == ''
         @recruit= Recruit.all.order(created_at: :desc)
      else
         @recruit= Recruit.where(genre:params[:search]).order(created_at: :desc)
      end
   end

   def new
      @recruit = Recruit.new
   end

   def create
      recruit = Recruit.new(recruit_params)
      recruit.user_id = current_user.id
      if recruit.save
         redirect_to :action => "index"
      else
         redirect_to :action =>"new"
      end
   end 

   def show
      @recruit = Recruit.find(params[:id])
      @comments = @recruit.comments
      @comment = Comment.new
   end

   def destroy
      recruit = Recruit.find(params[:id])
      recruit.destroy
      redirect_to action: :index
   end


   private 
   def recruit_params
      params.require(:recruit).permit(:title,:genre,:body,:image,:links)
   end

end