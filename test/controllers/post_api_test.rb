require 'test_helper'

describe PostsController do
  # reference: https://github.com/plataformatec/devise/wiki/How-To%3a-Controllers-tests-with-Rails-3-%28and-rspec%29
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
    it 'can create a post via api' do
      expected = {
        title: Faker::Name.name,
        body: Faker::Lorem.paragraph,
        published: true
      }
      post_params = {
        post: expected
      }

      sign_in users(:editor)
      request.env["HTTP_ACCEPT"] = "application/json"
      request.env["CONTENT_TYPE"] = "application/json"
      post :create, post_params, format: :json

      Post.count.must_equal 1
      Post.last.title.must_equal expected[:title]
      response.status.must_equal 201
    end
  end

  describe 'DELETE /posts/:id' do
    it 'deletes a post via JSON' do
      skip
    end
  end

  describe 'PATCH /posts/:id' do
    it 'updates a post via JSON' do
      skip
    end
  end
end
