require 'rails_helper'

RSpec.describe Menu, type: :model do
  subject(:menu) { described_class.new(**params) }

  context 'When saving a Menu with' do
    context 'no name' do
      let(:params) { {} }

      it 'fails validation' do
        expect { menu.save! }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/)
      end
    end
  end
end
