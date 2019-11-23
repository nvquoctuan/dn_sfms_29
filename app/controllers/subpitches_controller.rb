class SubpitchesController < ApplicationController
  before_action :load_pitch
  before_action :load_subpitch, only: :show

  def index
    @subpitches = @pitch.subpitches
  end

  def show; end

  private

  def load_pitch
    @pitch = Pitch.find_by id: params[:pitch_id].to_i
    return if @pitch

    flash[:danger] = t ".subpitches.danger_load"
    redirect_to root_path
  end

  def load_subpitch
    @subpitch = Subpitch.find_by id: params[:id]
    return if @subpitch

    flash[:danger] = t ".subpitches.danger_load_subpitch"
    redirect_to root_path
  end
end
