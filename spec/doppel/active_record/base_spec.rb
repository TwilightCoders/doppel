require 'spec_helper'

describe Doppel::ActiveRecord::Base do

  context '#find_similar' do
    it "emails" do

      User.create(name: "John Doe", email: 'foo@bar.baz')
      User.create(name: "John Deer", email: 'foo@bar.baz')
      User.create(name: "Dear John", email: 'bar24@foo.baz')

      similar_users = User.find_similar(:email).to_a

      expect(similar_users.count).to eq(2)
    end

    it "names" do

      User.create(name: "John Deer", email: 'foo@bar.baz')
      User.create(name: "John Dear", email: 'foo1@bar.baz')
      User.create(name: "Dear John", email: 'bar24@foo.baz')

      similar_users = User.find_similar(:name).to_a

      expect(similar_users.count).to eq(2)
    end
  end

  context '#find_exact' do
    it "emails" do

      User.create(name: "John Doe", email: 'foo@bar.baz')
      User.create(name: "John Deer", email: 'foo@bar.baz')
      User.create(name: "Dear John", email: 'bar24@foo.baz')

      exact_users = User.find_exact(:email).to_a

      expect(exact_users.count).to eq(2)
    end

    it "names" do

      User.create(name: "John Deer", email: 'foo@bar.baz')
      User.create(name: "John Deer", email: 'foo1@bar.baz')
      User.create(name: "Dear John", email: 'bar24@foo.baz')

      exact_users = User.find_exact(:name).to_a

      expect(exact_users.count).to eq(2)
    end
  end

end
