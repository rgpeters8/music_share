require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @post = user.posts.build(description: "this is a test video", 
      title: "Test Vid",
      play_count: 0,
      playlist: "Playlist1",
      youtube_id: "FVUSFVdmvYQ",
      category: "Other")
  end

  subject { @post }

  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:title) }
  it { should respond_to(:play_count) }
  it { should respond_to(:playlist) }
  it { should respond_to(:youtube_id) }
  it { should respond_to(:category) }
  
  it { should respond_to(:user) }
  its(:user) { should eq user }
  
  it { should be_valid }

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @post.description = "a" * 425 }
    it { should_not be_valid }
  end
end