class EntriesController < ApplicationController

  def new
  @entry = Entry.new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    #@entry["occurred_on"] = params["occurred_on"]
    #@entry["image"] = params["entry"]["image"]
    @entry.uploaded_image.attach(params["entry"]["uploaded_image"])
    #@entry.uploaded_image.attach(params["entry"]["uploaded_image"])
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = session["user_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
