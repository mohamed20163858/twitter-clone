require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do

    context "user is not logged in" do 
      it "returns http success" do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end 

    context "user is logged in" do 
        it "redirect to dashboard page " do 
        user = create(:user)
        sign_in user 
        get root_path 
        expect(response).to have_http_status(:redirect)
      end
    end
    
  end

end
