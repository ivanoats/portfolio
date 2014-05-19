require 'test_helper'

describe PostsController do
  include Devise::TestHelpers

  before :all do
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    Post.delete_all
  end

  describe 'GET /posts' do
    before :each do
      @title1 = Faker::Name.name
      @body1  = Faker::Lorem.paragraph

      @title2 = Faker::Name.name
      @body2  = Faker::Lorem.paragraph

      @title3 = Faker::Name.name
      @body3  = Faker::Lorem.paragraph

      Post.create!(title: @title1, body: @body1, published: true)
      Post.create!(title: @title2, body: @body2, published: true)
      Post.create!(title: @title3, body: @body3, published: false)
    end

    it 'is successful' do
      get :index, format: :json
      response.status.must_equal 200
    end

    it 'returns all the published posts' do
      get :index, format: :json
      body = JSON.parse(response.body)
      post_titles = body.map { |m| m['title'] }
      post_titles.must_include @title1
      post_titles.must_include @title2
    end

    it 'does not return the unpublished posts' do
      get :index, format: :json
      body = JSON.parse(response.body)
      post_titles = body.map { |m| m['title'] }
      post_titles.wont_include @title3
    end
  end

  describe 'POST /posts' do
    it 'is successful' do
      response.status.must_equal 200
    end

    it 'can create a post via api' do
      mock_post = Struct.new(:title, :body, :published)
      expected = mock_post.new(Faker::Name.name, Faker::Lorem.paragraph, true)

      post :index, expected.as_json, format: :json
      # why is this not getting posted as json?
      get :index, format: :json
      body = JSON.parse(response.body)
      post_titles = body.map { |m| m['title'] }
      post_titles.must_include expected.title
    end
  end
end
