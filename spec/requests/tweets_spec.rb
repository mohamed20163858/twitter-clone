require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "Post / create " do

    context "user is not logged in" do 
      it "responds with redirect" do
        post tweets_path, params: { 
            tweet: {
                body: "new tweet body" 
            } 
        }
        expect(response).to have_http_status(:redirect)
      end
    end 

    context "user is logged in" do 
        it "creates a new tweets" do 
        user = create(:user)
        sign_in user 
        expect do  
            post tweets_path, params: { 
                tweet: {
                    body: "new tweet body" 
                } 
            }
        end.to change { Tweet.count }.by(1)
        expect(response).to redirect_to(dashboard_path)
      end
    end
    
  end

end
