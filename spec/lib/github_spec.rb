require "spec_helper"

RSpec.describe Github, vcr: true do

  context "ip can be geolocated" do
    let(:facebook) { Github.new("facebook")}

    describe "#account_type" do
      it "returns the facebook github account type" do
        expect(facebook.account_type).to eq("Organization")
      end
    end
  end
end
