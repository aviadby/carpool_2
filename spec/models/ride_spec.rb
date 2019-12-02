require 'rails_helper'

RSpec.describe Ride, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:spots) }

    it { should belong_to(:leader) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
