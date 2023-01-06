require 'rails_helper'

RSpec.describe Worker, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:dept) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:shifts) }
  end

  describe '#no_overlapping_shifts' do

    context 'when worker has overlapping shifts' do
       let(:worker) { FactoryBot.build(:worker) }

      it 'should add an error' do
        
        shift1 = FactoryBot.build(:shift, start_at: DateTime.now.beginning_of_day, end_at: DateTime.now.beginning_of_day + 4.hours)
        shift2 = FactoryBot.build(:shift, start_at: DateTime.now.beginning_of_day + 2.hours, end_at: DateTime.now.beginning_of_day + 6.hours)
        worker.shifts = [shift1, shift2]
        expect(worker).to be_invalid
        expect(worker.errors[:shifts]).to include("cannot overlap")
      end
    end

    context 'when worker has no overlapping shifts' do
      it 'should not add an error' do
        
        create(:shift, start_at: Date.today.beginning_of_day, end_at: Date.today.end_of_day)
        create(:shift, start_at: Date.today.end_of_day + 1.hour, end_at: Date.today.end_of_day + 2.hours)
        expect(worker.valid?).to be true
      end
    end
  end
end

