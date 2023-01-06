require 'rails_helper'

RSpec.describe Shift, type: :model  do

    describe "#validate_shift_time_frame" do
      let(:worker) { FactoryBot.build(:worker) }
  
      it "allows shifts that are 8 hours or less" do
        shift = build(:shift, start_at: 0, end_at: 8, worker: worker)
        expect(shift).to be_valid
      end
  
      it "does not allow shifts that are more than 8 hours" do
        shift = build(:shift, start_at: 0, end_at: 9, worker: worker)
        expect(shift).to be_invalid
        expect(shift.errors[:start_at]).to include("shift must be 8 hours or less")
      end
    end 
end
