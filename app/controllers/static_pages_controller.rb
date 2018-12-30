class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @project = current_user.projects.build
      @feed_items = current_user.feed.paginate(page: params[:page])

    end
  end

  def team
  end

  def chat
    
      session[:conversations] ||= []

      @users = User.all.where.not(id: current_user)
      @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])

  end

  def workshops
  end

  def gallery
  end

  def project_under_rbd
    @users = User.paginate(page: params[:page])
  end

  def contact
  end
end
