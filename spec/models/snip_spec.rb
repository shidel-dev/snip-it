require 'spec_helper'

describe Snip do
  let(:title)       {'New Snipit'}
  let(:description) {'description'}
  let(:content)     {'class NewClass; end'}
  # let(:languge)     {'Ruby'}
  # let(:creator)     {1}

  before do
    @snip = Snip.new
    @snip_no_board = Snip.new(title: title, description: description, content: content)
    @user = User.create(email: 'email@email.com', first_name: 'foo', last_name: 'bar', password_digest: 'password')
    @valid_snip = Snip.new(title: title, description: description, content: content, user_id: @user.id)
  end

  describe "relationships" do
    it "belongs to a user" do
      expect{@valid_snip.save}.to change{Snip.all.size}.by(1)
    end
  end

  describe "#create" do
    it "does not increase database count by 1 when saved without a user id" do
      expect{@snip_no_board.save}.to_not change{Snip.all.size}.by(1)
    end
  end
    
end