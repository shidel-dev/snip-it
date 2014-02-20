require 'spec_helper'

describe Snip do
  let(:title)       {'New Snipit'}
  let(:description) {'description'}
  let(:content)     {'class NewClass; end'}
  # let(:languge)     {'Ruby'}
  # let(:creator)     {1}

  before do
    @snip = Snip.new
    @snip_filled = Snip.new(title: title, description: description, content: content)
  end

  describe "#create" do
    it "increases database count by 1 when saved" do
      expect{@snip_filled.save}.to change{Snip.all.size}.by(1)
    end
  end
    
end