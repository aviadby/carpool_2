require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:spots) }

    it { should have_many(:rides) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
