class ClientAuth
  def outgoing(message, callback)
    unless message['channel'] != '/userSessionInfo/'
      return callback.call(message)
    end
    message['ext'] ||= {}
    message['ext']['password'] = 'thisisjustanonprodone!'
    callback.call(message)
  end
end
