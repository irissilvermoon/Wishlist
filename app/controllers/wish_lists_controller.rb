class WishListsController < ApplicationController
  # GET /wish_lists
  # GET /wish_lists.json
  def index
    @wish_lists = WishList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wish_lists }
    end
  end

  # GET /wish_lists/1
  # GET /wish_lists/1.json
  def show
    @wish_list = WishList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wish_list }
    end
  end

  # GET /wish_lists/new
  # GET /wish_lists/new.json
  def new
    @wish_list = WishList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wish_list }
    end
  end

  # GET /wish_lists/1/edit
  def edit
    @wish_list = WishList.find(params[:id])
  end

  # POST /wish_lists
  # POST /wish_lists.json
  def create
    @wish_list = WishList.new(params[:wish_list])

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

  # PUT /wish_lists/1
  # PUT /wish_lists/1.json
  def update
    @wish_list = WishList.find(params[:id])

    respond_to do |format|
      if @wish_list.update_attributes(params[:wish_list])
        format.html { redirect_to @wish_list, notice: 'Wish list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wish_lists/1
  # DELETE /wish_lists/1.json
  def destroy
    @wish_list = WishList.find(params[:id])
    @wish_list.destroy

    respond_to do |format|
      format.html { redirect_to wish_lists_url }
      format.json { head :no_content }
    end
  end
end
