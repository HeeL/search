require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the StaticPostsHelper. For example:
#
# describe StaticPostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe StaticPostsHelper do
  it "should not return an empty string for a title" do
    StaticPostsController::TOPICS.each{|topic| helper.page_title(topic).should_not be_empty}
  end
  
  it "returns proper page title for each page" do
    helper.page_title('topic3').should == 'The page title for topic3'
  end
end
