class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def get_content(object)
    content = Content.create(:contentable => object, :user => current_user)
    return content
  end
end
