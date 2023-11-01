require 'rails_helper'

RSpec.describe "Movies", type: :request do
  let(:user) {User.create(
    email: 'test1@example.com',
    password: 'password',
    password_confirmation: 'password'
  )}
  describe "GET /index" do
    
  end
end
