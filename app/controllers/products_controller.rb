class ProductsController < ApplicationController

  def index
    store = Store.friendly.find(params[:store_id])
    @products = store.products
    @order_item = current_order.order_items.new
  end

  def show
    store = Store.friendly.find(params[:store_id])
    @product = store.products.find(params[:id])
    @order_item = current_order.order_items.new
  end

  def new
    store = current_user.store
    @product = store.products.build
    @categories = Category.all.map{|c| [ c.name, c.id ] }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /posts/:post_id/comments/:id/edit
  def edit
    store = current_user.store
    @product = store.products.find(params[:id])
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /posts/:post_id/comments
  # POST /posts/:post_id/comments.xml
  def create
    store = current_user.store
    @product = store.products.create(product_params)
    @product.category_id = params[:category_id]
    redirect_to store
  end

  # PUT /posts/:post_id/comments/:id
  # PUT /posts/:post_id/comments/:id.xml
  def update
    #1st you retrieve the post thanks to params[:post_id]
    store = current_user.store
    @product = store.products.find(params[:id])
    @product.category_id = params[:category_id]

    respond_to do |format|
      if @products.update_attributes(product_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@product.store, @product], :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/:post_id/comments/1
  # DELETE /posts/:post_id/comments/1.xml
  def destroy
    store = current_user.store
    @product = store.products.find(params[:id])
    @product.destroy

    respond_to do |format|
      #1st argument reference the path /posts/:post_id/comments/
      format.html { redirect_to(store_products_url) }
      format.xml  { head :ok }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :image)
  end
end
