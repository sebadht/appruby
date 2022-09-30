class UserTest < ActiveSupport::TestCase

  RSpec.describe 'Users', type: :request do
    before(:each) do
      @attr_valid = {
        name: 'Example name',
        last_name: 'Example last name',
        email: 'Example@email.cl',
        password: 'Example password'
      }
      @attr_update = {
        name: 'Update name',
        last_name: 'Update last name',
        email: 'Update@email.cl',
        password: 'Update password'
      }
      @attr_invalid = {
        name: '',
        last_name: '',
        email: '',
        password: ''
      }
    end

    ## Users index test
    describe 'index' do
      it 'should return a successful request' do
        get '/users'
        expect(response).to have_http_status(:ok)
      end
    end

    ## Users show test
    describe 'show' do
      it 'should return a successful request' do
        user = User.create!(@attr_valid)
        get users_show_path(:id => user.id)
        expect(response).to have_http_status(:ok)
      end
    end

  end
end
