class SearchController < ApplicationController
  include ActionView::Helpers::SanitizeHelper
  
  def index
    return if params[:request].blank?
    @articles = Article.where('`title` LIKE ? OR `text` LIKE ?', "%#{params[:request]}%", "%#{params[:request]}%")
    @results = static_pages_search
  end


  private
  
  def static_pages_search
    StaticPostsController::TOPICS.select{|topic| match_found(topic)}
  end

  def match_found(topic)
    strip_tags(File.read("#{Rails.root}/app/views/static_posts/topics/_#{topic}.html.erb")).include?(params[:request])
  end
end
