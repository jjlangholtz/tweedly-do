require 'rails_helper'

describe UsersController do
  describe 'GET #show' do
    it 'responds successfully with an HTTP 200 status code' do
      get :show, id: create(:user)
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      get :show, id: create(:user)
      expect(response).to render_template 'show'
    end
  end

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template 'new'
    end
  end

  describe 'POST #create' do
    context 'with valid user parameters' do
      let(:valid_user) {{name: 'John', email: 'foo@bar.com', password: 'password'}}

      it 'creates a new user' do
        post :create, user: valid_user
        expect(User.count).to eq 1
      end

      it 'stores the user id in session' do
        post :create, user: valid_user
        expect(session[:current_user_id]).to eq User.first.id
      end

      it 'redirects to user show page after save' do
        post :create, user: valid_user
        expect(response.status).to eq 302
      end
    end

    context 'with invalid user parameters' do
      let(:invalid_user) {{name: '', email: '', password: ''}}

      it 'does not create a new user' do
        post :create, user: invalid_user
        expect(User.count).to eq 0
      end

      it 'renders the new template again' do
        post :create, user: invalid_user
        expect(response).to render_template 'new'
      end
    end
  end
end
