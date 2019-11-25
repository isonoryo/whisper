class WhispersController < ApplicationController
  def index
    @whispers = Whisper.all
  end

  def new
    @whisper = Whisper.new
  end

  def create
    Whisper.create(whisper_params)
    redirect_to new_whisper_path
  end

  private

  def whisper_params
    params.require(:whisper).permit(:content)
  end
end
