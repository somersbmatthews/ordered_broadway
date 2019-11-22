# defmodule OrderedBroadway.Instrumenter do
#    def setup do
#      events = [
#        [:web, :request, :start],
#        [:web, :request, :success],
#        [:web, :request, :failure],
#      ]
 
#      :telemetry.attach_many("myapp-instrumenter", events, &handle_event/4, nil)
#    end
 
#    def handle_event([:web, :request, :start], measurements, metadata, _config) do
#      ...
#    end
 
#    def handle_event([:web, :request, :success], measurements, metadata, _config) do
#      ...
#    end
 
#    def handle_event([:web, :request, :failure], measurements, metadata, _config) do
#      ...
#    end
#  end