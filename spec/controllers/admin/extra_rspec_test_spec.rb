require 'spec_helper'

describe Admin::CategoriesController do
  render_views
  
  before(:each) do
    Factory(:blog)
    #TODO Delete after removing fixtures
    Profile.delete_all
    henri = Factory(:user, :login => 'henri', :profile => Factory(:profile_admin, :label => Profile::ADMIN))
    request.session = { :user => henri.id }
  end
  
  describe "test_create" do
    before(:each) do
      get :new
    end

    it 'should render template new' do
      assert_template 'new'
      assert_tag :tag => "table",
        :attributes => { :id => "category_container" }
    end

    it 'should create a new category' do
      post :edit, :category => {:name => "Foobar", :keywords => "key", :permalink => "link", :description => "description"}
      assert_response :redirect, :action => "index"
      expect(assigns(:category)).not_to be_nil
      expect(flash[:notice]).to eq('Category was successfully saved.')
    end
  end
end