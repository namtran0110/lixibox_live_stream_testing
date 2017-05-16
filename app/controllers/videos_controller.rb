class VideosController < ApplicationController
  def upload
    puts params.inspect
    uploaded = params[:file]
    File.open("public/clips/#{Time.now.to_s.parameterize}.webm", "wb") { |f| f.write(uploaded.read)}
    render :plain => "uploaded"
  end
end
