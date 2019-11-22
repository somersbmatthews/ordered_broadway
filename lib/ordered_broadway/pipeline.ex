defmodule Pipeline do
   use Broadway
 
   alias Broadway.Message
 
   def start_link(_opts) do
     Broadway.start_link(__MODULE__,
       name: Pipeline,
       producers: [
         default: [
           module: {BroadwayRabbitMQ.Producer,
             queue: "ampq.queue",
             connection: [
               username: "guest",
               password: "guest",
             ]
           },
           stages: 2
         ]
       ],
       processors: [
         default: [
           stages: 50
         ]
       ],
       batchers: [
         default: [
           batch_size: 5,
           batch_timeout: 1500,
           stages: 5
         ]
       ]
     )
   end

   @impl true
   def handle_message(_, message, _) do
    Broadway.Telemetry.tracker("message received in handle_message, handle_message in pipeline.ex", message)
      # raise HandleMessageError, message: "fake error #{message}"
      # raise "error"
    #  failed_message = Message.failed(message, "fake error reason")
     
     
    #  failed_message
   #   |> Message.update_data(fn data -> {data, String.to_integer(data) * 2} end)
  #  |> Message.update_data(fn data -> {data, String.to_integer(data) * 2} end)
    Broadway.Telemetry.tracker("message dispatched in handle_message, handle_message in pipeline.ex", message)
    IO.inspect(message)
     
   end

   # def ack_messages(successful, failed) do
   #    IO.inspect(successful)
   #    IO.inspect(failed)
   # end
   @impl true
   def handle_batch(_, messages, _, _) do
     list = messages |> Enum.map(fn e -> e.data end)
     IO.inspect(list, label: "Got batch")
     messages
   end

   defp process_data(data) do
    # Do some calculations, generate a JSON representation, process images.
  end
end