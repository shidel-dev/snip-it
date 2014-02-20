require 'spec_helper'

describe Board do

  before do
    @board = Board.new(title: 'new board')
  end

  describe "#create" do
    it "increases database count by 1 when saved" do
      expect{@board.save}.to change{Board.all.size}.by(1  )
    end
  end
end