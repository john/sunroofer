require 'rails_helper'

RSpec.describe RoofSetsController, :type => :controller do
  
  describe "GET new" do
    let(:roof_set) { create :roof_set }
    
    it "redirects if not logged in" do
      get :new
      expect(response).to redirect_to('/users/sign_in')
    end
  end
  
  describe "GET show" do
    let(:roof_set) { create :roof_set }
    
    it "works if not logged in" do
      get :show, params: {id: roof_set.id}
      expect(response).to have_http_status(:success)
    end
  end
end