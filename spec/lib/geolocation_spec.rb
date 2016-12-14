# require "spec_helper"
#
# RSpec.describe Geolocation, vcr: true do
#   context "ip can be geolocated" do
#     let(:geolocation) { Geolocation.new("8.8.8.8") }
#
#     describe "#city" do
#       it "returns the city based on ip" do
#         expect(geolocation.city).to eq("Mountain View")
#       end
#     end
#
#     describe "#state" do
#       it "returns the state based on ip" do
#         expect(geolocation.state).to eq("California")
#       end
#     end
#
#     describe "#zip" do
#       it "returns the zip code based on ip" do
#         expect(geolocation.zip).to eq("94040")
#       end
#     end
#
#     describe "#country" do
#       it "returns the country name based on ip" do
#         expect(geolocation.country).to eq("United States")
#       end
#     end
#   end
#
#   context "ip cannot be geolocated" do
#     let(:geolocation) { Geolocation.new("127.0.0.1") }
#
#     describe "#city" do
#       it "returns Boston" do
#         expect(geolocation.city).to eq("Boston")
#       end
#     end
#
#     describe "#state" do
#       it "returns Massachusetts" do
#         expect(geolocation.state).to eq("Massachusetts")
#       end
#     end
#
#     describe "#zip" do
#       it "returns 02124" do
#         expect(geolocation.zip).to eq("02124")
#       end
#     end
#
#     describe "#country" do
#       it "returns United States" do
#         expect(geolocation.country).to eq("United States")
#       end
#     end
#   end
# end
