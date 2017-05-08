require 'httparty'
require 'kele/roadmap'


class Kele
  include HTTParty
  include Roadmap
  
 

    def initialize(email, password)
        response = self.class.post(base_api_endpoint("sessions"), body:{"email": email, "password": password})
        raise InvalidStudentCodeError.new() if response.code == 401
        @auth_token = response["auth_token"]
    end


private

  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end

  
end
 