class HomeController < ApplicationController
  def index
    #stores that are not empty
    @stores = Store.joins(:products).group('stores.id')
    @streaming_stores = Store.where(streaming_now: true)
    @other_stores = @stores - @streaming_stores
  end
end
