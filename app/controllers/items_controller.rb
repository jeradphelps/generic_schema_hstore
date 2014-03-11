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

    # @item.item_category.item_category_attributes.each do |item_category_attribute|
    #   @item.item_attribute_values.build(:item_category_attribute_id => item_category_attribute.id)
    # end
  end

  def create
    @item = Item.new(item_params)

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
