window.setupStoreChat = (storeId) ->
  App.messages = App.cable.subscriptions.create {
    channel: 'MessagesChannel'
    store_id: storeId},
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log 'App.messages :: connected on store-id:', storeId

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log 'App.messages :: disconnected'

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      #console.log 'App.messages :: received', data

      # received a message
      if 'body' of data
        $('.messages').append data.body
        scrollTop = $('.messages').scrollTop()
        $('.messages').scrollTop(scrollTop + 90);

      #received an end stream action
      if 'action' of data
        cleanStream()

    createMessage: (data) ->
      #console.log 'App.messages :: createMessage', data
      if data.body.length > 0
        @perform 'create_message', data

    endStream: (bool) ->
      # Called when the streamer has ended
      @perform 'end_stream'

    cleanStream = ->
      #empty stream
      $('video, #stop-recording').remove()
      $('#fake-video-placeholder').removeClass('display-none')
      $('#stream .overlay').removeClass('show');
      $('#stream .overlay').addClass('hide');
      #replace headlines with offline headlines
      $('#store-headline .message').text '\'s stream is offline, but products are available for purchase at any time!'
      $('#other-products-headline').text 'Products:'
      #move products from stream into normal product pool, and remove streaming-product section
      $('#streaming-products .wrapper').each ->
        $(this).insertBefore '#main-products .wrapper:first-of-type'
        return
      $('#streaming-products').remove()

