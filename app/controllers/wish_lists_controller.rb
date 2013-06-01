class WishListsController < ApplicationController
  # GET /wish_lists
  # GET /wish_lists.json
  before_filter :authenticate_user!
  before_filter :find_user, :except => [:new, :create]
  before_filter :find_wish_list, :except => [:index, :new, :create]

  def index
    @wish_lists = @user.wish_lists.order(:title).page(params[:page]).per(24)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wish_lists }
    end
  end

  # GET /wish_lists/new
  # GET /wish_lists/new.json
  def new
    @wish_list = current_user.wish_lists.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wish_list }
    end
  end

  # POST /wish_lists
  # POST /wish_lists.json
  def create
    @wish_list = current_user.wish_lists.build(params[:wish_list])

    respond_to do |format|
      if @wish_list.save
        format.html { redirect_to new_wish_list_item_path(@wish_list), notice: 'Wish list was successfully created.' }
        format.json { render json: @wish_list, status: :created, location: @wish_list }
      else
        flash[:alert] = "Wish list has not been created."
        format.html { render action: "new" }
        format.json { render json: @wish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /wish_lists/1
  # GET /wish_lists/1.json
  #def show
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @wish_list }
  #  end
  #end

  # GET /wish_lists/1/edit
  def edit
  end

  # PUT /wish_lists/1
  # PUT /wish_lists/1.json
  def update
    respond_to do |format|
      if @wish_list.update_attributes(params[:wish_list])
        format.html { redirect_to @wish_list, notice: 'Wish list was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:alert] = "Wish list has not been updated."
        format.html { render action: "edit" }
        format.json { render json: @wish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wish_lists/1
  # DELETE /wish_lists/1.json
  def destroy
    @wish_list.destroy
    respond_to do |format|
      format.html { redirect_to wish_lists_url, :notice => 'Wish list has been deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def find_user
    @user = current_user.watched_users.where(:id => params[:user_id]).first || current_user
  end

  def find_wish_list
    @wish_list = @user.wish_lists.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The wish list you were looking for could not be found."
    redirect_to :back
  end
end
