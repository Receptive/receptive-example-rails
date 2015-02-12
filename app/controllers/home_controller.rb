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
        "id" => Rails.configuration.receptive_vendor_id
      },
      "user" => {
        "full_name" => "Robo Cop",
        "email" => "john@example.com",
        "id" => "u123456"
      },
      "return_url" => "http://localhost:3001",
    }    
    @signed_snippet = sign_snippet(unsigned_snippet)
  end
  
  private


  def sign_snippet(unsigned)
    concat_values = ([Rails.configuration.receptive_secret_key] + [unsigned["return_url"]] + [unsigned["timestamp"]] + unsigned["account"].values + unsigned["user"].values + unsigned["vendor"].values).sort.join(",")
    signature = Digest::SHA256.new << concat_values
    unsigned["signature"] = signature.to_s
    unsigned.to_json
  end

end
