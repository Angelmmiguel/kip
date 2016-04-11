require 'rails_helper'

RSpec.describe Help::MarkdownController, type: :controller do
  describe 'Index' do
    it 'renders the index template with success' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end
end
