class EntriesController < ApplicationController
  before_action :authorized

  def index
  end

  def new
  end

  def create
    @topic = Topic.find_by(slug: params[:topic_id])
    @entry = @topic.entries.build(params.require(:entry).permit(:body))
    @entry.user = current_user
    if @entry.save
      flash[:notice] = "Your entry was topiced"
      redirect_to topic_path(@topic)
    else
      @topic.entries.reload
      render 'topics/show'
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

end
