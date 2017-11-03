##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Proxy < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class SessionContext < InstanceContext
            class ParticipantContext < InstanceContext
              ##
              # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
              class MessageInteractionList < ListResource
                ##
                # Initialize the MessageInteractionList
                # @param [Version] version Version that contains the resource
                # @param [String] service_sid The unique SID identifier of the Service.
                # @param [String] session_sid The unique SID identifier of the Session.
                # @param [String] participant_sid The unique SID identifier of the Participant.
                # @return [MessageInteractionList] MessageInteractionList
                def initialize(version, service_sid: nil, session_sid: nil, participant_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {service_sid: service_sid, session_sid: session_sid, participant_sid: participant_sid}
                  @uri = "/Services/#{@solution[:service_sid]}/Sessions/#{@solution[:session_sid]}/Participants/#{@solution[:participant_sid]}/MessageInteractions"
                end

                ##
                # Retrieve a single page of MessageInteractionInstance records from the API.
                # Request is executed immediately.
                # @param [String] body The body
                # @param [String] media_url The media_url
                # @return [MessageInteractionInstance] Newly created MessageInteractionInstance
                def create(body: :unset, media_url: :unset)
                  data = Twilio::Values.of({'Body' => body, 'MediaUrl' => Twilio.serialize_list(media_url) { |e| e },})

                  payload = @version.create(
                      'POST',
                      @uri,
                      data: data
                  )

                  MessageInteractionInstance.new(
                      @version,
                      payload,
                      service_sid: @solution[:service_sid],
                      session_sid: @solution[:session_sid],
                      participant_sid: @solution[:participant_sid],
                  )
                end

                ##
                # Lists MessageInteractionInstance records from the API as a list.
                # Unlike stream(), this operation is eager and will load `limit` records into
                # memory before returning.
                # @param [Integer] limit Upper limit for the number of records to return. stream()
                #    guarantees to never return more than limit.  Default is no limit
                # @param [Integer] page_size Number of records to fetch per request, when
                #    not set will use the default value of 50 records.  If no page_size is defined
                #    but a limit is defined, stream() will attempt to read the limit with the most
                #    efficient page size, i.e. min(limit, 1000)
                # @return [Array] Array of up to limit results
                def list(limit: nil, page_size: nil)
                  self.stream(limit: limit, page_size: page_size).entries
                end

                ##
                # Streams MessageInteractionInstance records from the API as an Enumerable.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                # @param [Integer] limit Upper limit for the number of records to return. stream()
                #    guarantees to never return more than limit. Default is no limit.
                # @param [Integer] page_size Number of records to fetch per request, when
                #    not set will use the default value of 50 records. If no page_size is defined
                #    but a limit is defined, stream() will attempt to read the limit with the most
                #    efficient page size, i.e. min(limit, 1000)
                # @return [Enumerable] Enumerable that will yield up to limit results
                def stream(limit: nil, page_size: nil)
                  limits = @version.read_limits(limit, page_size)

                  page = self.page(page_size: limits[:page_size],)

                  @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                end

                ##
                # When passed a block, yields MessageInteractionInstance records from the API.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                def each
                  limits = @version.read_limits

                  page = self.page(page_size: limits[:page_size],)

                  @version.stream(page,
                                  limit: limits[:limit],
                                  page_limit: limits[:page_limit]).each {|x| yield x}
                end

                ##
                # Retrieve a single page of MessageInteractionInstance records from the API.
                # Request is executed immediately.
                # @param [String] page_token PageToken provided by the API
                # @param [Integer] page_number Page Number, this value is simply for client state
                # @param [Integer] page_size Number of records to return, defaults to 50
                # @return [Page] Page of MessageInteractionInstance
                def page(page_token: :unset, page_number: :unset, page_size: :unset)
                  params = Twilio::Values.of({
                      'PageToken' => page_token,
                      'Page' => page_number,
                      'PageSize' => page_size,
                  })
                  response = @version.page(
                      'GET',
                      @uri,
                      params
                  )
                  MessageInteractionPage.new(@version, response, @solution)
                end

                ##
                # Retrieve a single page of MessageInteractionInstance records from the API.
                # Request is executed immediately.
                # @param [String] target_url API-generated URL for the requested results page
                # @return [Page] Page of MessageInteractionInstance
                def get_page(target_url)
                  response = @version.domain.request(
                      'GET',
                      target_url
                  )
                  MessageInteractionPage.new(@version, response, @solution)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Proxy.V1.MessageInteractionList>'
                end
              end

              ##
              # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
              class MessageInteractionPage < Page
                ##
                # Initialize the MessageInteractionPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [MessageInteractionPage] MessageInteractionPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of MessageInteractionInstance
                # @param [Hash] payload Payload response from the API
                # @return [MessageInteractionInstance] MessageInteractionInstance
                def get_instance(payload)
                  MessageInteractionInstance.new(
                      @version,
                      payload,
                      service_sid: @solution[:service_sid],
                      session_sid: @solution[:session_sid],
                      participant_sid: @solution[:participant_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Proxy.V1.MessageInteractionPage>'
                end
              end

              ##
              # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
              class MessageInteractionContext < InstanceContext
                ##
                # Initialize the MessageInteractionContext
                # @param [Version] version Version that contains the resource
                # @param [String] service_sid The unique SID identifier of the Service.
                # @param [String] session_sid The unique SID identifier of the Session.
                # @param [String] participant_sid The unique SID identifier of the Participant.
                # @param [String] sid A 34 character string that uniquely identifies this Message
                #   Interaction.
                # @return [MessageInteractionContext] MessageInteractionContext
                def initialize(version, service_sid, session_sid, participant_sid, sid)
                  super(version)

                  # Path Solution
                  @solution = {
                      service_sid: service_sid,
                      session_sid: session_sid,
                      participant_sid: participant_sid,
                      sid: sid,
                  }
                  @uri = "/Services/#{@solution[:service_sid]}/Sessions/#{@solution[:session_sid]}/Participants/#{@solution[:participant_sid]}/MessageInteractions/#{@solution[:sid]}"
                end

                ##
                # Fetch a MessageInteractionInstance
                # @return [MessageInteractionInstance] Fetched MessageInteractionInstance
                def fetch
                  params = Twilio::Values.of({})

                  payload = @version.fetch(
                      'GET',
                      @uri,
                      params,
                  )

                  MessageInteractionInstance.new(
                      @version,
                      payload,
                      service_sid: @solution[:service_sid],
                      session_sid: @solution[:session_sid],
                      participant_sid: @solution[:participant_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Proxy.V1.MessageInteractionContext #{context}>"
                end
              end

              ##
              # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
              class MessageInteractionInstance < InstanceResource
                ##
                # Initialize the MessageInteractionInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] service_sid The unique SID identifier of the Service.
                # @param [String] session_sid The unique SID identifier of the Session.
                # @param [String] participant_sid The unique SID identifier of the Participant.
                # @param [String] sid A 34 character string that uniquely identifies this Message
                #   Interaction.
                # @return [MessageInteractionInstance] MessageInteractionInstance
                def initialize(version, payload, service_sid: nil, session_sid: nil, participant_sid: nil, sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'sid' => payload['sid'],
                      'session_sid' => payload['session_sid'],
                      'service_sid' => payload['service_sid'],
                      'account_sid' => payload['account_sid'],
                      'data' => payload['data'],
                      'type' => payload['type'],
                      'participant_sid' => payload['participant_sid'],
                      'inbound_participant_sid' => payload['inbound_participant_sid'],
                      'inbound_resource_sid' => payload['inbound_resource_sid'],
                      'inbound_resource_status' => payload['inbound_resource_status'],
                      'inbound_resource_type' => payload['inbound_resource_type'],
                      'inbound_resource_url' => payload['inbound_resource_url'],
                      'outbound_participant_sid' => payload['outbound_participant_sid'],
                      'outbound_resource_sid' => payload['outbound_resource_sid'],
                      'outbound_resource_status' => payload['outbound_resource_status'],
                      'outbound_resource_type' => payload['outbound_resource_type'],
                      'outbound_resource_url' => payload['outbound_resource_url'],
                      'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                      'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                      'url' => payload['url'],
                  }

                  # Context
                  @instance_context = nil
                  @params = {
                      'service_sid' => service_sid,
                      'session_sid' => session_sid,
                      'participant_sid' => participant_sid,
                      'sid' => sid || @properties['sid'],
                  }
                end

                ##
                # Generate an instance context for the instance, the context is capable of
                # performing various actions.  All instance actions are proxied to the context
                # @return [MessageInteractionContext] MessageInteractionContext for this MessageInteractionInstance
                def context
                  unless @instance_context
                    @instance_context = MessageInteractionContext.new(
                        @version,
                        @params['service_sid'],
                        @params['session_sid'],
                        @params['participant_sid'],
                        @params['sid'],
                    )
                  end
                  @instance_context
                end

                ##
                # @return [String] A string that uniquely identifies this Message Interaction.
                def sid
                  @properties['sid']
                end

                ##
                # @return [String] Session Sid.
                def session_sid
                  @properties['session_sid']
                end

                ##
                # @return [String] Service Sid.
                def service_sid
                  @properties['service_sid']
                end

                ##
                # @return [String] Account Sid.
                def account_sid
                  @properties['account_sid']
                end

                ##
                # @return [String] Further details about an interaction.
                def data
                  @properties['data']
                end

                ##
                # @return [message_interaction.Type] The Type of this Message Interaction
                def type
                  @properties['type']
                end

                ##
                # @return [String] Participant Sid.
                def participant_sid
                  @properties['participant_sid']
                end

                ##
                # @return [String] Inbound Participant Sid.
                def inbound_participant_sid
                  @properties['inbound_participant_sid']
                end

                ##
                # @return [String] Inbound Resource Sid.
                def inbound_resource_sid
                  @properties['inbound_resource_sid']
                end

                ##
                # @return [message_interaction.ResourceStatus] The Inbound Resource Status of this Message Interaction
                def inbound_resource_status
                  @properties['inbound_resource_status']
                end

                ##
                # @return [String] The type of the Inbound Resource, Call or Message.
                def inbound_resource_type
                  @properties['inbound_resource_type']
                end

                ##
                # @return [String] The URL of the Twilio resource.
                def inbound_resource_url
                  @properties['inbound_resource_url']
                end

                ##
                # @return [String] Outbound Participant Sid.
                def outbound_participant_sid
                  @properties['outbound_participant_sid']
                end

                ##
                # @return [String] Outbound Resource Sid.
                def outbound_resource_sid
                  @properties['outbound_resource_sid']
                end

                ##
                # @return [message_interaction.ResourceStatus] The Outbound Resource Status of this Message Interaction
                def outbound_resource_status
                  @properties['outbound_resource_status']
                end

                ##
                # @return [String] The type of the Outbound Resource, Call or Message.
                def outbound_resource_type
                  @properties['outbound_resource_type']
                end

                ##
                # @return [String] The URL of the Twilio resource.
                def outbound_resource_url
                  @properties['outbound_resource_url']
                end

                ##
                # @return [Time] The date this Message Interaction was created
                def date_created
                  @properties['date_created']
                end

                ##
                # @return [Time] The date this Message Interaction was updated
                def date_updated
                  @properties['date_updated']
                end

                ##
                # @return [String] The URL of this resource.
                def url
                  @properties['url']
                end

                ##
                # Fetch a MessageInteractionInstance
                # @return [MessageInteractionInstance] Fetched MessageInteractionInstance
                def fetch
                  context.fetch
                end

                ##
                # Provide a user friendly representation
                def to_s
                  values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Proxy.V1.MessageInteractionInstance #{values}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Proxy.V1.MessageInteractionInstance #{values}>"
                end
              end
            end
          end
        end
      end
    end
  end
end