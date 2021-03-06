require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it "can be constructed without params" do
    expect(Feedback.new.comment).to be_nil
  end

  it "has an email" do
    expect(Feedback.new(:email => 'foo').email).to eq('foo')
  end

  it "has a petition link or title" do
    expect(Feedback.new(:petition_link_or_title => 'foo').petition_link_or_title).to eq('foo')
  end

  it "has a comment" do
    expect(Feedback.new(:comment => 'foo').comment).to eq('foo')
  end

  def valid_attributes
    { :email => "foo@example.com",
      :comment => "I can't submit a petition for some reason",
      :petition_link_or_title => 'link' }
  end

  describe "valid?" do
    it "is valid when all attributes are in place" do
      expect(Feedback.new(valid_attributes)).to be_valid
    end

    it "is not valid when a required attribute is missing" do
      expect(Feedback.new(valid_attributes.except(:comment))).not_to be_valid
    end

    it "is not valid when the email format is wrong" do
      expect(Feedback.new(valid_attributes.merge(:email => 'foo'))).not_to be_valid
    end
  end

end
