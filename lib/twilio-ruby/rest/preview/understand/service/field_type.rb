##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class Understand < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class FieldTypeList < ListResource
            ##
            # Initialize the FieldTypeList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @return [FieldTypeList] FieldTypeList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/FieldTypes"
            end

            ##
            # Lists FieldTypeInstance records from the API as a list.
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
            # Streams FieldTypeInstance records from the API as an Enumerable.
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
            # When passed a block, yields FieldTypeInstance records from the API.
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
            # Retrieve a single page of FieldTypeInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of FieldTypeInstance
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
              FieldTypePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of FieldTypeInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of FieldTypeInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              FieldTypePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of FieldTypeInstance records from the API.
            # Request is executed immediately.
            # @param [String] unique_name The unique_name
            # @param [String] friendly_name The friendly_name
            # @return [FieldTypeInstance] Newly created FieldTypeInstance
            def create(unique_name: nil, friendly_name: :unset)
              data = Twilio::Values.of({'UniqueName' => unique_name, 'FriendlyName' => friendly_name,})

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              FieldTypeInstance.new(@version, payload, service_sid: @solution[:service_sid],)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Understand.FieldTypeList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class FieldTypePage < Page
            ##
            # Initialize the FieldTypePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [FieldTypePage] FieldTypePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of FieldTypeInstance
            # @param [Hash] payload Payload response from the API
            # @return [FieldTypeInstance] FieldTypeInstance
            def get_instance(payload)
              FieldTypeInstance.new(@version, payload, service_sid: @solution[:service_sid],)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Understand.FieldTypePage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class FieldTypeContext < InstanceContext
            ##
            # Initialize the FieldTypeContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [FieldTypeContext] FieldTypeContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid,}
              @uri = "/Services/#{@solution[:service_sid]}/FieldTypes/#{@solution[:sid]}"

              # Dependents
              @field_values = nil
            end

            ##
            # Fetch a FieldTypeInstance
            # @return [FieldTypeInstance] Fetched FieldTypeInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              FieldTypeInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid],)
            end

            ##
            # Update the FieldTypeInstance
            # @param [String] friendly_name The friendly_name
            # @param [String] unique_name The unique_name
            # @return [FieldTypeInstance] Updated FieldTypeInstance
            def update(friendly_name: :unset, unique_name: :unset)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, 'UniqueName' => unique_name,})

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              FieldTypeInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid],)
            end

            ##
            # Deletes the FieldTypeInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Access the field_values
            # @return [FieldValueList]
            # @return [FieldValueContext] if sid was passed.
            def field_values(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return FieldValueContext.new(@version, @solution[:service_sid], @solution[:sid], sid,)
              end

              unless @field_values
                @field_values = FieldValueList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    field_type_sid: @solution[:sid],
                )
              end

              @field_values
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Understand.FieldTypeContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class FieldTypeInstance < InstanceResource
            ##
            # Initialize the FieldTypeInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [FieldTypeInstance] FieldTypeInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'links' => payload['links'],
                  'service_sid' => payload['service_sid'],
                  'sid' => payload['sid'],
                  'unique_name' => payload['unique_name'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'],}
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [FieldTypeContext] FieldTypeContext for this FieldTypeInstance
            def context
              unless @instance_context
                @instance_context = FieldTypeContext.new(@version, @params['service_sid'], @params['sid'],)
              end
              @instance_context
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The friendly_name
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The links
            def links
              @properties['links']
            end

            ##
            # @return [String] The service_sid
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The unique_name
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # Fetch a FieldTypeInstance
            # @return [FieldTypeInstance] Fetched FieldTypeInstance
            def fetch
              context.fetch
            end

            ##
            # Update the FieldTypeInstance
            # @param [String] friendly_name The friendly_name
            # @param [String] unique_name The unique_name
            # @return [FieldTypeInstance] Updated FieldTypeInstance
            def update(friendly_name: :unset, unique_name: :unset)
              context.update(friendly_name: friendly_name, unique_name: unique_name,)
            end

            ##
            # Deletes the FieldTypeInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the field_values
            # @return [field_values] field_values
            def field_values
              context.field_values
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.FieldTypeInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Understand.FieldTypeInstance #{values}>"
            end
          end
        end
      end
    end
  end
end