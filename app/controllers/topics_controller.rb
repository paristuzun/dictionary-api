class TopicsController < ApplicationController
  # before_action :set_topic, only: [:show, :update]
  # before_action :authorized, except: [:index, :show]

  def index
    @topics = Topic.all
    render json: @topics.to_json(include: :entries), status: :ok
  end

  def vote
    @vote = Vote.create(voteable: @topic, user: current_user, vote: params[:vote])
    respond_to do |format|
      if @vote.valid?
        format.html {redirect_to :back, notice: "Your vote was counted!"}
        format.js
      else
        format.html {redirect_to :back, notice: "Your vote wasn't counted!"}
        format.js {
          render 'vote_failure'
        }
      end
    end
  end

  def show

    @topic = Topic.find(params[:id])

  
    render json: @topic.to_json(include: :entries), status: :ok

  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      # render json: @topic.to_json(include: :entries), status: :created
      render json: @topic.to_json, status: :created
    else
      # byebug
      render json: { errors: @topic.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, category_ids: [])
  end

  def set_topic
    @topic = Topic.find_by(slug: params[:id])
  end
end
