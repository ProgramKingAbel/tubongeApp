require 'rails_helper'

RSpec.describe 'Healths', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      # the example performs a get request to /health/index route
      get '/health/index'

      # response is a special object with HTTP response received after a request is sent
      # response.body is the body of the HTTP response that in this case contains JSON

      expect(response.body).to eq('{"status":"online"}')

      # check status
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end
  end
end
