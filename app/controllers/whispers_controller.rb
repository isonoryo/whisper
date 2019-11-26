class WhispersController < ApplicationController
  before_action :set_whisper, only: [:edit, :update, :destroy]

  def index
    @whispers = Whisper.all
  end

  def new
    @whisper = Whisper.new
  end

  def create
    @whisper = Whisper.new(whisper_params)
    if params[:back]
      render :new
    else
      if @whisper.save
        # 一覧画面へ遷移し、つぶやき完了の表示を行う
        redirect_to new_whisper_path, notice: "つぶやきを受け付けました！"
      else
      # つぶやき入力フォームを再描画する。
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @whisper.update(whisper_params)
      redirect_to new_whisper_path, notice:"つぶやきを編集しました！！！"
    else
      render :edit
    end
  end

  def destroy
    @whisper.destroy
    redirect_to whispers_path, notice:"つぶやきを削除しました！！"
  end

  def confirm
    @whisper = Whisper.new(whisper_params)
    render :new if @whisper.invalid?
  end

  private

  def whisper_params
    params.require(:whisper).permit(:content)
  end

  def set_whisper
    @whisper = Whisper.find(params[:id])
  end
end
