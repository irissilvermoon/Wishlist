class ItemsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :find_wish_list


  # GET /items
  # GET /items.json
  def index
    @items = @wish_list.items.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = @wish_list.items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = @wish_list.items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = @wish_list.items.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = @wish_list.items.build(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to wish_list_items_path(@wish_list), notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = @wish_list.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to wish_list_item_path(@wish_list), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:alert] = "Item has not been updated."
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = @wish_list.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to wish_list_items_path(@wish_list), notice: "Item has been deleted." }
      format.json { head :no_content }
    end
  end

  def find_wish_list
    @wish_list = current_user.wish_lists.find(params[:wish_list_id])
  end
end
