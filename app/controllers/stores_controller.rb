class StoresController < ApplicationController
  def show
    @store = Store.friendly.find(params[:id])
    if @store == nil
      render file: "#{Rails.root}/public/404.html", layout: false
    end

    if params[:streaming_now]
      start_stream
    end

    if params[:end_stream]
      end_stream
    end

    @messages = @store.messages
    @streaming_products = Product.where(id: @store.stream_instance.product_ids)
    @products = @store.products - @streaming_products
    @order_item = current_order.order_items.new
    @video = Video.all

  end

  def edit
    @store = Store.friendly.find(params[:id])
  end

  def start_stream
    @streamer_view = true
    @stream_name = params[:stream_name]
    streaming_product_ids = params[:product_ids]
    #@streaming_products = Product.where(id: streaming_product_ids)

    @store.update(streaming_now: true)
    clean_stream_instance
    @store.stream_instance.update(title: @stream_name, product_ids: streaming_product_ids)
  end

  def end_stream
    @store.update(streaming_now: false)
    clean_stream_instance
    respond_to do |format|
      format.html {
        flash[:success] = "Stream Ended"
        redirect_to dashboard_path
      }
      format.js {
        flash.now[:success] = "stream Ended"
      }
    end
  end

  def clean_stream_instance
    @store.stream_instance.update(title: nil, product_ids: [])
  end

end
