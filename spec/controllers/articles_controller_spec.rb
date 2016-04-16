require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'Index' do
    render_views

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
      create(:article)
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end

    it 'renders welcome when no article' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include('Welcome to')
    end
  end

  describe 'Show' do
    it 'an article' do
      article = create(:article)
      get :show, id: article.id
      # Article and text must be initialized
      expect(assigns(:article)).not_to be_nil
      expect(assigns(:text)).not_to be_nil

      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
  end

  describe 'Footer' do
    render_views

    it "musn't be showed in welcome" do
      get :index
      expect(response.body).not_to include('<footer')
    end

    it 'must be showed in index' do
      create(:article)
      get :index
      expect(response.body).to include('<footer')
    end

    it 'must be showed in show' do
      article = create(:article)
      get :show, id: article.id
      expect(response.body).to include('<footer')
    end
  end
end
