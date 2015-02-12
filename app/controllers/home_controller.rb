class HomeController < ApplicationController

  def index
    unsigned_snippet = {
      "timestamp" => DateTime.now.iso8601,
      "account" => {
        "id" => "a123456",
        "is_paying" => "false",
        "monthly_value" => "99.99"
      },
      "vendor" => {
        "id" => "VENDOR ID GOES HERE" # put your own vendor ID here
      },
      "user" => {
        "full_name" => "Robo Cop",
        "email" => "john@example.com",
        "id" => "u123456"
      },
      "return_url" => "http://example.com/user/u123456",
    }    
    @signed_snippet = sign_snippet(unsigned_snippet)
  end
  
  private

  # don't expose this to your app users
  # get your own secret from https://receptive.io/app/#/integrate
  #
  SECRET = "secret goes here" 

  def sign_snippet(unsigned)
    concat_values = ([SECRET] + [unsigned["return_url"]] + [unsigned["timestamp"]] + unsigned["account"].values + unsigned["user"].values + unsigned["vendor"].values).sort.join(",")
    signature = Digest::SHA256.new << concat_values
    unsigned["signature"] = signature.to_s
    unsigned.to_json
  end

end
