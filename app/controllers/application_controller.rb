class ApplicationController < ActionController::Base
  protect_from_forgery


    def draw(data)

   pdf = PDF::Writer.new


   
    data["project"].each do |output|
     pdf.text output.to_s

    end
    pdf.render
    
  end

  def get_json
   #base_url = "http://localhost:3000/books.json"
   #base_url = "greenova.bitnamiapp.com","/redmine/projects.json?&key=ec6c5c86a1a3fed56384a0c2ded9ee93d4bafb9b"
   

   resp = Net::HTTP.get_response("greenova.bitnamiapp.com","/redmine/projects/greenova-mobiledev.json?&key=ec6c5c86a1a3fed56384a0c2ded9ee93d4bafb9b")
   data = resp.body
   puts data.class
   puts data


   return JSON.parse(data)
    
  end
end
