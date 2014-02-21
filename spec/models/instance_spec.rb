require 'spec_helper'

describe Instance do
  let(:description) {'description'}
  let(:content)     {'class NewClass; end'}

  before do
    @blank_instance = Instance.new
    @user = User.create(email: 'email@email.com', first_name: 'foo', last_name: 'bar', password: 'password', password_confirmation: 'password')
    @language = Language.create(name: "Ruby")
    @board = Board.create(title: title, user_id: @user.id)
    @snip = Snip.create(title: title, description: description, content: content, user_id: @user.id, language_id: @language.id)
    @valid_instance = Instance.new(board_id: @board.id, snip_id: @snip.id)
  end

  describe "relationship" do
    it "saves to the database when belongs to snipit and board" do
      expect{@valid_instance.save}.to change{Instance.all.size}.by(1)
    end
  end

  describe "#create" do
    it "does not save to the database when missing user and board ids" do
      expect{@blank_instance.save}.to_not change{Instance.all.size}
    end
  end
end