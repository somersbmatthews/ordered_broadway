# {:ok, connection} = AMQP.Connection.open
# {:ok, channel} = AMQP.Channel.open(connection)
# AMQP.Queue.declare(channel, "hello")
# AMQP.Basic.publish(channel, "", "hello", "Hello World!")
# IO.puts " [x] Sent 'Hello World!'"
# AMQP.Connection.close(connection)


{:ok, connection} = AMQP.Connection.open
{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "ampq.queue", durable: true)

Enum.each(1..5, fn i ->
  AMQP.Basic.publish(channel, "", "ampq.queue", "#{i}")
end)
AMQP.Connection.close(connection)