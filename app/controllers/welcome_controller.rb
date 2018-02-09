class WelcomeController < ApplicationController
  def index
    @topics = Topic.all.limit(10).order("created_at desc")
  end

  def about
  end

  def faq
  end

end
