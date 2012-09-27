module StaticPostsHelper

  def page_title(title)
    case title
    when 'topic1'
      'The page title for topic1'
    when 'topic2'
      'The page title for topic2'
    when 'topic3'
      'The page title for topic3'  
    end
  end
  
end
