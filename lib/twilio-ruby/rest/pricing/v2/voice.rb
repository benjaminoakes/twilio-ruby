##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Pricing < Domain
      class V2 < Version
        class VoiceList < ListResource
          ##
          # Initialize the VoiceList
          # @param [Version] version Version that contains the resource
          # @return [VoiceList] VoiceList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}

            # Components
            @countries = nil
          end

          ##
          # Access the countries
          # @param [String] iso_country This fetches the origin-based voice pricing
          #   information for a specific country
          # @return [CountryList]
          # @return [CountryContext] if iso_country was passed.
          def countries(iso_country=:unset)
            raise ArgumentError, 'iso_country cannot be nil' if iso_country.nil?

            if iso_country != :unset
              return CountryContext.new(@version, iso_country, )
            end

              @countries ||= CountryList.new(@version, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Pricing.V2.VoiceList>'
          end
        end

        class VoicePage < Page
          ##
          # Initialize the VoicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [VoicePage] VoicePage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of VoiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [VoiceInstance] VoiceInstance
          def get_instance(payload)
            VoiceInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Pricing.V2.VoicePage>'
          end
        end

        class VoiceInstance < InstanceResource
          ##
          # Initialize the VoiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [VoiceInstance] VoiceInstance
          def initialize(version, payload)
            super(version)

            # Marshaled Properties
            @properties = {'name' => payload['name'], 'url' => payload['url'], 'links' => payload['links'], }
          end

          ##
          # @return [String] The name
          def name
            @properties['name']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Provide a user friendly representation
          def to_s
            "<Twilio.Pricing.V2.VoiceInstance>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            "<Twilio.Pricing.V2.VoiceInstance>"
          end
        end
      end
    end
  end
end