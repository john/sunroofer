require 'rails_helper'

RSpec.describe BuildingsController, :type => :controller do
  
  describe "GET show" do
    let(:building) { create :building }
    
    it "works if not logged in" do
      get :show, params: {id: building.id}
      expect(response).to have_http_status(:success)
    end
    
    context "logged in" do
      login
      
      it "works if logged in" do
        get :show, params: {id: building.id}
        expect(response).to have_http_status(:success)
      end
    end
  end
end