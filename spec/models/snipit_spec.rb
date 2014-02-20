require 'spec_helper'

describe Snipit do
  let(:title)       {'New Snipit'}
  let(:description) {'description'}
  let(:content)     {'class NewClass; end'}
  # let(:languge)     {'Ruby'}
  # let(:creator)     {1}

  before do
    @snipit = Snip.new
    @snipit_filled = Snip.new(title: title, description: description, content: content)
  end

  describe "#" do
    it "increases database count by 1 when saved" do
      expect{@snipit_filled.save}.to change{Snip.all.size}.by(1)
    end
  end
    
end