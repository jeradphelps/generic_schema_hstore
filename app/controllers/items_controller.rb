class ItemsController < ApplicationController
  def index
    @item_category = ItemCategory.find(params[:item_category_id])
    @items = Item.where(:item_category_id => params[:item_category_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item_category = ItemCategory.find(params[:item_category_id])
    @item = Item.new(:item_category_id => @item_category.id)
  end

  def create
    # This is kind of lame.  Why not just do the normal: @item = Item.new(item_params)
    # well, were setting accessors to our dynamic attributes (ItemCategoryAttributes)
    # In an after_initialize callback.  Since there is no before_initialize callback,
    # this emulates that behavior.  Basically, initialize an item with a category id
    # that triggers the callbacks and sets our accessors, then we can assign_attributes
    @item = Item.new(:item_category_id => params[:item_category_id])
    @item.assign_attributes(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
    @item_category = @item.item_category
  end

  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    #todo
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      # todo figure out a way to lock this down.
      params.require(:item).permit!
      # params.require(:item).permit!.tap do |whitelisted|
      #   whitelisted[:values] = params[:item][:values] 
      # end
    end
end
