class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]

  def set_topic
    @topic = Topic.find_by(slug: params[:id])
  end

  def index
    @topics = Topic.all
    render json: @topics, status: 200
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
    @entry = Entry.new
      render json: @topic, status: 200

      topic = Topic.find(params[:id])

      topic_json = {
        id: topic.id,
        title: topic.title,
        description: topic.description
      }

      render json: topic_json
  end

  def new
    @topic = Topic.new
    @categories = Category.all
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      flash[:notice] = "Your topic was created"
      redirect_to topics_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @topic.update(topic_params)
      flash[:notice] = "Your topic was updated"
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :description, category_ids: [])
  end
end
