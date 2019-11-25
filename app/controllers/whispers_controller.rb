class WhispersController < ApplicationController
  def index
    @whispers = Whisper.all
  end

  def new
    @whisper = Whisper.new
  end

  def create
    @whisper = Whisper.new(whisper_params)
    if @whisper.save
      # 一覧画面へ遷移し、つぶやき完了の表示を行う
      redirect_to new_whisper_path, notice: "つぶやきを受け付けました！"
    else
      # つぶやき入力フォームを再描画する。
      render :new
    end
  end
  private

  def whisper_params
    params.require(:whisper).permit(:content)
  end
end
