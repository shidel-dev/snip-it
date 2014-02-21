require 'spec_helper'

describe Board do

  let(:title) {"New Board"}

  before do
    @board = Board.new(title: title)
    @user = User.create(email: 'email@email.com', first_name: 'foo', last_name: 'bar', password: 'password', password_confirmation: 'password')
  end

  describe "relationships" do
    it "belongs to a user" do
      new_board = @user.boards.new(title: title)
      expect{new_board.save}.to change{Board.all.size}.by(1)
    end
  end

  describe "#create" do
    it "does not increase database count by 1 when saved without a user id" do
      expect{@board.save}.to_not change{Board.all.size}
    end
  end

end