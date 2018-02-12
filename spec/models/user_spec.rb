require 'rails_helper'

describe User, type: :model do
  describe "validates" do
    it "presence of username" do
      user = User.new(password: "Password")

      expect(user).to_not be_valid
    end

    it "uniqueness of username" do
      orig = User.create(email: "user", password: "Password")
      copy_cat = User.new(email: "user", password: "Password")

      expect(copy_cat).to_not be_valid
    end

    it  "can be created as an admin" do
      user = User.create(email: "captain america", password: "avenger", role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "can be created as a default user" do
      user = User.create(email: "bucky barnes", password: "winter soldier", role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

  end
end
