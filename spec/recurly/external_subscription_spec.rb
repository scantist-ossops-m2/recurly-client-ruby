require 'spec_helper'

describe ExternalSubscription do
  let(:external_subscription) {
    ExternalSubscription.new(
      account: Account.new(account_code: 'account_code'),
      external_product_reference: ExternalProductReference.new(
        id: "abc123",
        reference_code: "reference_code 1",
        external_connection_type: "app store connect",
        created_at: "2019-08-24T14:15:22Z",
        updated_at: "2019-08-24T14:15:22Z"
      ),
      quantity: 1,
      activated_at: "2022-11-07 17:08:18",
      created_at: "2022-11-07 17:08:18",
      expires_at: "2022-12-07 17:08:18",
      updated_at: "2022-11-07 17:08:18",
      last_purchased: "2022-11-07 17:08:18",
      auto_renew: true,
      app_identifier: 'apple_play_store',
      external_id: 'abcd1234',
      state: 'active'
    )
  }

  describe 'serializing the record' do
    it 'must serialize' do
      external_subscription.to_xml.must_equal <<XML.chomp
<external_subscription>\
<account><account_code>account_code</account_code></account>\
<activated_at>2022-11-07 17:08:18</activated_at>\
<app_identifier>apple_play_store</app_identifier>\
<auto_renew>true</auto_renew>\
<created_at>2022-11-07 17:08:18</created_at>\
<expires_at>2022-12-07 17:08:18</expires_at>\
<external_id>abcd1234</external_id>\
<external_product_reference>\
<created_at>2019-08-24T14:15:22Z</created_at>\
<external_connection_type>app store connect</external_connection_type>\
<id>abc123</id>\
<reference_code>reference_code 1</reference_code>\
<updated_at>2019-08-24T14:15:22Z</updated_at>\
</external_product_reference>\
<last_purchased>2022-11-07 17:08:18</last_purchased>\
<quantity>1</quantity>\
<state>active</state>\
<updated_at>2022-11-07 17:08:18</updated_at>\
</external_subscription>
XML
    end
  end
end
