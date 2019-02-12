class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :vote]
  before_action :authorized, except: [:index, :show]

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

    # topic_json = {
    #   id: topic.id,
    #   title: topic.title,
    #   description: topic.description,
    #   url: topic.url,
    #   slug: topic.slug,
    #   entries: topic.entries.map do |entry|
    #     {
    #       id: entry.id,
    #       body: entry.body,
    #       user_id: entry.user_id,
    #       votes_count: entry.votes_count
    #     }
    #   end
    # }
    render json: @topic.to_json(include: :entries), status: :ok
    # render json: topic_json
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save

    else

    end
  end

  def update
    if @topic.update(topic_params)

    else

    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :description, category_ids: [])
  end

  def set_topic
    @topic = Topic.find_by(slug: params[:id])
  end
end
