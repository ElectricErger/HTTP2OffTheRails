class ClientConnection
  def initialize(client)
    #Client has opened a communication
    #TCP has already done it's handshake
    
    initialState(client)
    
    #Now we wait for requests and process them accordingly
    while 1 do
      #DO THINGS DEPENDING ON THE STATE
      
      #Check once every second
      sleep 1
    end
  end
  
  def initialState(client)
    #Initialize the connection protocol    
  end
  
  #FSM?
end