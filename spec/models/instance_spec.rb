require 'spec_helper'

describe Instance do

  before do
    @instance = Instance.new
  end

  describe "#create" do
    it "increases database count by 1 when saved" do
      expect{@instance.save}.to change{Instance.all.size}.by(1)
    end
  end
end