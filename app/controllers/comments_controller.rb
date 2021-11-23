class CommentsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      recruit = Recruit.find(params[:recruit_id])
      comment = recruit.comments.build(comment_params) #buildを使い、contentとtweet_idの二つを同時に代入
      comment.user_id = current_user.id
      if comment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
    private
  
      def comment_params
        params.require(:comment).permit(:content)
      end
  end
  
