##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Role' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .roles("RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://ip-messaging.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles/RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "channel user",
          "type": "channel",
          "permissions": [
              "sendMessage",
              "leaveChannel",
              "editOwnMessage",
              "deleteOwnMessage"
          ],
          "date_created": "2016-03-03T19:47:15Z",
          "date_updated": "2016-03-03T19:47:15Z",
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles/RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                    .roles("RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .roles("RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://ip-messaging.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles/RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                    .roles("RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()

    expect(actual).to eq(true)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .roles.create(friendly_name: "friendly_name", type: "channel", permission: ['permission'])
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'FriendlyName' => "friendly_name",
        'Type' => "channel",
        'Permission' => Twilio.serialize_list(['permission']) { |e| e },
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://ip-messaging.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "channel user",
          "type": "channel",
          "permissions": [
              "sendMessage",
              "leaveChannel",
              "editOwnMessage",
              "deleteOwnMessage"
          ],
          "date_created": "2016-03-03T19:47:15Z",
          "date_updated": "2016-03-03T19:47:15Z",
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles/RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                    .roles.create(friendly_name: "friendly_name", type: "channel", permission: ['permission'])

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .roles.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://ip-messaging.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "roles"
          },
          "roles": [
              {
                  "sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "channel user",
                  "type": "channel",
                  "permissions": [
                      "sendMessage",
                      "leaveChannel",
                      "editOwnMessage",
                      "deleteOwnMessage"
                  ],
                  "date_created": "2016-03-03T19:47:15Z",
                  "date_updated": "2016-03-03T19:47:15Z",
                  "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles/RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                    .roles.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "roles"
          },
          "roles": []
      }
      ]
    ))

    actual = @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                    .roles.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .roles("RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update(permission: ['permission'])
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Permission' => Twilio.serialize_list(['permission']) { |e| e },}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://ip-messaging.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles/RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "channel user",
          "type": "channel",
          "permissions": [
              "sendMessage",
              "leaveChannel",
              "editOwnMessage",
              "deleteOwnMessage"
          ],
          "date_created": "2016-03-03T19:47:15Z",
          "date_updated": "2016-03-03T19:47:15Z",
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Roles/RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.ip_messaging.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                    .roles("RLaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update(permission: ['permission'])

    expect(actual).to_not eq(nil)
  end
end