require 'spec_helper'

describe SearchController do
  render_views
  
  it "should show forms before and after search" do
    visit(root_path)
    page.should have_xpath('//form/input[@value="Find"]')
  end
  
  it "should not show results when there is no request" do
    get :index
    page.should_not have_content('Results:')
  end
  
  it "should show results after submiting a form" do
    visit(root_path)
    fill_in 'request', with: 'Topic 1'
    click_button 'Find'
    page.should have_content('Results:')
  end
  
  it "should search by title and text" do
    Article.create(title: 'The topic 1', text: 'text')
    Article.create(title: 'The second', text: 'text2')
    get :index, request: 'topic'
    assigns(:articles).count.should eql(1)
    get :index, request: 'text'
    assigns(:articles).count.should eql(2)
  end

  it "should get static pages search result" do
    get :index, request: 'topic'
    assigns(:results).count.should eql(3)
  end

  it "should not show static page with no matches in results" do
    get :index, request: 'non existing on a page text'
    assigns(:results).should be_empty
  end

end
