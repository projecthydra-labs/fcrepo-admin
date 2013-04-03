require 'spec_helper'

shared_examples "a datastream show page" do
  it "should display all attributes of the datastream profile" do
    object.datastreams[dsid].profile.each do |key, value|
      expect(subject).to have_content(key.sub(/^ds/, ""))
      expect(subject).to have_content(value)
    end
  end
  it "should have a link to download the datastream content" do
    expect(subject).to have_link("Download", :href => download_datastream_path(object, dsid))
  end
end

shared_examples "an object having datastream show pages" do
  it_behaves_like "a datastream show page" do
    let(:dsid) { "DC" }
  end
  it_behaves_like "a datastream show page" do
    let(:dsid) { "RELS-EXT" }
  end
end

describe "datastreams/show.html.erb" do
  subject { page }
  before { visit fcrepo_admin_engine.datastream_path(object, dsid) }
  after { object.delete }
  it_behaves_like "an object having datastream show pages" do
    let(:object) { ActiveFedora::Base.create }
  end
end
