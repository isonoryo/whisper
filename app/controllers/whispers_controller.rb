class WhispersController < ApplicationController
  def index
  end

  def new
    @whisper = Whisper.new
  end

  def create
    Whisper.create(content: params[:whisper][:content])
    redirect_to new_whisper_path
  end
end
