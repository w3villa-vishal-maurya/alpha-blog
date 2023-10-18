module ApplicationHelper
  def filter_user_by_id(id)
    @user = User.find(id)
  end

  def validate_user_articles(article)
    if current_user
        current_user.id == article.user_id
    else
        return false
    end    
  end
end
