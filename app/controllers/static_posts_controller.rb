class StaticPostsController < ApplicationController

  TOPICS = ['topic1', 'topic2', 'topic3']
  
  def show
    raise 'Wrong Template' unless TOPICS.include?(params[:title])
  end

end
