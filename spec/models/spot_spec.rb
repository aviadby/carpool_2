require 'rails_helper'

RSpec.describe Spot, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:joiner) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
