require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'Index' do
    it 'assigns @articles' do
      create(:article)
      get :index
      expect(assigns(:articles)).not_to be_nil
    end

    it 'group articles by category' do
      categories = (1..5).map { |n| "category#{n}" }
      categories.each do |cat|
        create(:article, category: cat)
      end

      get :index
      expect(assigns(:articles)).to be_a Hash
      expect(assigns(:articles).keys).to eq(categories)
    end

    it 'renders the index template with success' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end
end
