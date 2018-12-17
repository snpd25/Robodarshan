class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @project = current_user.projects.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def team
  end

  def workshops
  end

  def gallery
  end

  def projects
  end

  def contact
  end
end
