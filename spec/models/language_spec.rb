require 'spec_helper'

describe Language do

  before do
    @ruby = Language.new(name: 'Ruby')
    @java = Language.new(name: 'Java')
    @c = Language.new(name: 'C')
  end

  describe "#create" do
    it "increases database count by 1 when saved" do
      expect{@ruby.save}.to change{Language.all.size}.by(1)
    end
  end
end