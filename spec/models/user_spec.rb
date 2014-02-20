require 'spec_helper'

describe User do

  before do
    @user = User.new(email: 'email@email.com', first_name: 'foo', last_name: 'bar', password_digest: 'password')
  end

  describe "#create" do
    it "increases database count by 1 when saved" do
      expect{@user.save}.to change{User.all.size}.by(1)
    end
  end
end