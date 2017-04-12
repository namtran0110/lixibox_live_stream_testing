class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "store_#{params[:store_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create_message(message_params)
    Rails.logger.info("create message #{message_params.inspect}")

    @message = Message.new message_params.slice('body')
    @message.store_id = params[:store_id]
    if current_user
      @message.user_id = current_user.id
      data = {:body => render_message(@message)}
    end

    ActionCable.server.broadcast("store_#{params[:store_id]}", data)
  end

  def render_message(message)
    ApplicationController.render partial: 'messages/message', locals: {message: message}
  end

  def end_stream(bool)
    ActionCable.server.broadcast("store_#{params[:store_id]}", bool)
  end
end
