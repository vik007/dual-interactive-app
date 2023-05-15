class Api::V1::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authentication

  private
  def authentication
    unless request.headers['HTTP_AUTHORIZATION'] == 'a75ba0ff-da81-467b-8f7d-d1515752b142'
      render json: { error: 'Authorized Access' } and return
    end
  end
end