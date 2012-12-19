class ChatsController < ApplicationController
  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.new
    @chat = Chat.new
    @chats = Chat.all
    @users = User.new
    @users = User.all

    @user_select = params[:user]
    if !@user_select.blank?
      render :partial => 'chat_session', :user => @user_select
    else
      respond_to do |format|
        format.html # index.html.erb
        format.js
        #format.json { render json: @chats }
      end
    end
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
    @chat = Chat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chat }
    end
  end

  # GET /chats/new
  # GET /chats/new.json
  def new
    @chat = Chat.new

    #respond_to do |format|
      #format.html # new.html.erb
      #format.json { render json: @chat }
    #end
  end

  # GET /chats/1/edit
  def edit
    @chat = Chat.find(params[:id])
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Chat.new(params[:chat])
    @chats = Chat.new

    respond_to do |format|
      if @chat.save
        #render :partial => 'chat_session'
        format.html #{ redirect_to @chat }
        format.js
        #format.json { render json: @chat, status: :created, location: @chat }
      else
        format.html { render action: "new" }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chats/1
  # PUT /chats/1.json
  def update
    @chat = Chat.find(params[:id])

    respond_to do |format|
      if @chat.update_attributes(params[:chat])
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to chats_path }
      format.json { head :no_content }
    end
  end
end
