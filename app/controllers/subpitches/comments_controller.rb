class Subpitches::CommentsController < ApplicationController
  before_action :check_pitch, :check_subpitch, :check_user
  before_action ->{check_comment params[:id_parent]}, only: :new
  before_action ->{check_comment params[:id]}, only: :destroy
  before_action :check_parent_comment, :load_comment, only: :create

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @comment = Comment.new comment_params

    if @comment.save
      flash[:success] = t "msg.create_success"
    else
      flash[:danger] = t "msg.create_danger"
    end
    @comment_parent = @comment.id_parent
    @comments = Comment.all
    respond_to do |format|
      format.html{redirect_to pitch_subpitch_path(@pitch, @subpitch)}
      format.js
    end
  end

  def destroy
    if @comments
      if @comments.parent_comment(params[:id]).present?
        @comments.parent_comment(params[:id]).destroy_all
        @status = 1
      end
    end
    @comment.destroy ? set_flash("success", "destroy", 1)
                       : set_flash("danger", "destroy", 1)
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit Comment::PARAMS
  end

  def check_user
    return if logged_in?

    flash[:danger] = t ".comments.danger_exists_user"
    redirect_to root_path
  end

  def check_pitch
    @pitch = Pitch.find_by id: params[:pitch_id]
    return if @pitch

    flash[:danger] = t ".comments.danger_exists_pitch"
    redirect_to root_path
  end

  def check_subpitch
    @params_subpitch = params[:subpitch_id]
    @subpitch = Subpitch.find_by id: @params_subpitch
    return if @subpitch

    flash[:danger] = t ".comments.danger_exists_subpitch"
    redirect_to pitch_subpitches_path(@pitch)
  end

  def check_comment id
    @comment = Comment.find_by id: id
    @comments = @subpitch.comments
    return if @comments || @comment

    flash[:danger] = t ".comments.danger_comment"
    redirect_to pitch_subpitch_path(@pitch, @subpitch)
  end

  def check_parent_comment
    comment_parent = Comment.find_by id: params[:comment][:id_parent]

    return unless comment_parent

    params[:comment][:id_parent] = (comment_parent.id_parent) ?
                                   comment_parent.id_parent :
                                   comment_parent.id
  end

  def load_comment
    @comments = @subpitch.comments
  end
end
