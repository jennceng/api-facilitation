require "spec_helper"

RSpec.describe Github do

  context "account information can be fetched", vcr: { cassette_name: "account_info" } do
    let(:facebook) { Github.new("facebook")}

    describe "#account_type" do
      it "returns the facebook github account type" do
        expect(facebook.account_type).to eq("Organization")
      end
    end

    describe "#avatar_url" do
      it "returns the facebook github account type" do
        expect(facebook.avatar_url).to eq("https://avatars.githubusercontent.com/u/69631?v=3")
      end
    end
  end
end
