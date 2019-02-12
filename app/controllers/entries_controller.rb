class EntriesController < ApplicationController
  # before_action :authorized

  before_action :set_entry, only: [:show, :update, :vote]
  before_action :authorized, except: [:index, :show]

  def index
  end


  def create
    @topic = Topic.find(params[:topic_id])
    @entry = @topic.entries.build(params.require(:entry).permit(:body))
    @entry.user = current_user
    if @entry.save
      render json: @entry.to_json, status: :created
    else
      # byebug
      render json: { errors: @entry.errors.full_messages }, status: :unprocessable_entity

    end
  end

  def vote
    @entry = Entry.find(params[:id])
    @vote = Vote.create(voteable: @entry, user: current_user, vote: params[:vote])
    respond_to do |format|
      if @vote.valid?
        format.html {redirect_to :back, notice: "Your vote was counted!"}
        format.js {
          render js: "$('#entry_<%= entry.id %>_votes').html('<%= entry.total_votes %>');"
        }
      else
        format.html {redirect_to :back, notice: "Your vote wasn't counted!"}
        format.js {
          render js: "alert('Sorry, you can only vote once...');"
        }
      end
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:body, :user_id, :topic_id, :votes_count )
  end

  def set_entry
    @entry = Entry.find_by(params[:id])
  end

end
