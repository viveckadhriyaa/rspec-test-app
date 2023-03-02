require 'rails_helper'

RSpec.describe User, type: :model do

  context "validation tests" do
    it "ensures first name presense" do
      user = User.new(last_name: "M", email: "viveck@gmail.com").save
      expect(user).to eq(false)
    end

    it "ensures last name presense" do
      user = User.new(first_name: "Viveck", email: "viveck@gmail.com").save
      expect(user).to eq(false)
    end

    it "ensures email presense" do
      user = User.new(first_name: "Viveck", last_name: "M").save
      expect(user).to eq(false)
    end

    it "should save successfully" do
      user = User.new(first_name: "Viveck", last_name: "M", email: "viveck@gmail.com").save
      expect(user).to eq(true)
    end

  end

  context "scope tests" do
    before(:each) do
      5.times do |count|
        conds = [true, false]
        User.new(first_name: "Viveck", last_name: "M", email: "viveck+#{count}@gmail.com", active: count.odd?).save
      end
    end

    it "should return active users" do
      expect(User.active_users.size).to eq(2)
    end

    it "should return inactive users" do
      expect(User.inactive_users.size).to eq(3)
    end

  end
  
end
