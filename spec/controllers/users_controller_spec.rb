require 'rails_helper'

describe UsersController do
  describe 'GET #show' do
    before(:example) {get :show, id: create(:user)}

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      expect(response).to render_template 'show'
    end
  end

  describe 'GET #new' do
    before(:example) {get :new}

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      expect(response).to render_template 'new'
    end
  end

  describe 'POST #create' do
    context 'with valid user parameters' do
      before(:example) {post :create, user: attributes_for(:user)}

      it 'creates a new user' do
        expect(User.count).to eq 1
      end

      it 'stores the user id in session' do
        expect(session[:current_user_id]).to eq User.first.id
      end

      it 'redirects to user show page after save' do
        expect(response.status).to eq 302
      end
    end

    context 'with invalid user parameters' do
      before(:example) {post :create, user: attributes_for(:user, name: '', email: '', password: '')}

      it 'does not create a new user' do
        expect(User.count).to eq 0
      end

      it 'renders the new template again' do
        expect(response).to render_template 'new'
      end
    end
  end
end
