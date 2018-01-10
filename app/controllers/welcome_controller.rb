class WelcomeController < ApplicationController
  def index
    @posts = current_user.posts.all.limit(5).order("created_at desc")
  end

  def about
  end

  def contact
  end

  def faq
  end

end
