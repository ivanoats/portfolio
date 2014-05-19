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

    it 'returns all the published posts' do
      get :index, format: :json
      response.status.must_equal 200
      body = JSON.parse(response.body)
      post_titles = body.map { |m| m['title'] }
      post_titles.must_include @title1
      post_titles.must_include @title2
    end

    it 'does not return the unpublished posts' do
      get :index, format: :json
      response.status.must_equal 200
      body = JSON.parse(response.body)
      post_titles = body.map { |m| m['title'] }
      post_titles.wont_include @title3
    end
  end
end
