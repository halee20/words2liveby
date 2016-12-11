class WordsController < ApplicationController
  def index
    @words = Word.all

    render("words/index.html.erb")
  end

  def show
    @word = Word.find(params[:id])

    render("words/show.html.erb")
  end

  def new
    @word = Word.new

    render("words/new.html.erb")
  end

  def create
    @word = Word.new

    @word.word = params[:word]
    @word.author = params[:author]
    @word.user_id = params[:user_id]

    save_status = @word.save

    if save_status == true
      redirect_to("/words/#{@word.id}", :notice => "Word created successfully.")
    else
      render("words/new.html.erb")
    end
  end

  def edit
    @word = Word.find(params[:id])

    render("words/edit.html.erb")
  end

  def update
    @word = Word.find(params[:id])

    @word.word = params[:word]
    @word.author = params[:author]
    @word.user_id = params[:user_id]

    save_status = @word.save

    if save_status == true
      redirect_to("/words/#{@word.id}", :notice => "Word updated successfully.")
    else
      render("words/edit.html.erb")
    end
  end

  def destroy
    @word = Word.find(params[:id])

    @word.destroy

    if URI(request.referer).path == "/words/#{@word.id}"
      redirect_to("/", :notice => "Word deleted.")
    else
      redirect_to(:back, :notice => "Word deleted.")
    end
  end
end
