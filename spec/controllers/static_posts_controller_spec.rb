require 'spec_helper'

describe StaticPostsController do

  describe "show" do
    it "should raise error when template doesn't exist" do
      lambda {get :show, title: 'non_existing_one'}.should raise_error(RuntimeError, 'Wrong Template')
    end
  
    it "should not raise an error when title is correct" do
      lambda {get :show, title: StaticPostsController::TOPICS.first}.should_not raise_error
    end
  end
end
