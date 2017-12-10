module ControllerMacros
  def login
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      user = FactoryGirl.create(:user)
      sign_in user, scope: :user
    end
  end

end
