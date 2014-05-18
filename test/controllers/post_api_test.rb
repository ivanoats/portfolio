require 'test_helper'

describe PostsController do
  include Devise::TestHelpers

  setup do
    @request.env['devise.mapping'] = Devise.mappings[:admin]
  end

  describe 'GET /posts' do
    it 'returns all the published posts' do
      # fixtures?
      get :index, {} , 'Accept' => 'application/json'

      response.status.must_equal 200

      body = JSON.parse(response.body)
      post_titles = body.map { |m| m['title'] }

      expect(post_titles).to match_array(['Code Rails', 'Intro to HTTP'])
    end
  end
end
