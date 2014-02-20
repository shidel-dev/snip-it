require 'spec_helper'
# require 'shoulda-matchers'

describe Snip do
  let(:title)       {'New Snipit'}
  let(:description) {'description'}
  let(:content)     {'class NewClass; end'}
  # let(:languge)     {'Ruby'}
  # let(:creator)     {1}

  # it { should_belong_to(:user) }
    

  before do
    @user = User.create(email: 'email@email.com', first_name: 'foo', last_name: 'bar', password_digest: 'password')
    @language = Language.create(name: "Ruby")
    @valid_snip = Snip.new(title: title, description: description, content: content, user_id: @user.id, language_id: @language.id)
  end

  describe "relationships" do

    it "does not increase database count by 1 when saved without a language id" do
      snip_no_language = Snip.new(title: title, description: description, content: content, user_id: @user.id)
      expect{snip_no_language}.to_not change{Snip.all.size}
    end

    it "does not increase database count by 1 when saved without a user id" do
      snip_no_board = Snip.new(title: title, description: description, content: content, language_id: @language.id)
      expect{snip_no_board.save}.to_not change{Snip.all.size}
    end
  end

  describe "#create" do
    it "adds to database" do
      expect{@valid_snip.save}.to change{Snip.all.size}.by(1)
    end
  end
    
end