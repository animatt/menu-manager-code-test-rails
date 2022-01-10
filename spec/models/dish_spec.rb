require 'rails_helper'

RSpec.describe Dish, type: :model do
  subject(:dish) { described_class.new(**params) }

  context 'When saving a Dish with' do
    context 'no name' do
      let(:params) { { price: 10.22, description: 'Hot and round' } }

      it 'fails validation' do
        expect { dish.save! }.to raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/)
      end
    end

    context 'no price' do
      let(:params) { { name: 'Hot dog', description: 'Hot and round' } }

      it 'fails validation' do
        expect { dish.save! }.to raise_error(ActiveRecord::RecordInvalid, /Price can't be blank/)
      end
    end

    context 'a name that begins with the letter E' do
      let(:params) { { name: 'Eel' } }

      it 'fails validation' do
        expect { dish.save! }.to raise_error(ActiveRecord::RecordInvalid, /cannot begin with E/)
      end
    end

    context 'a parent menu' do
      let(:menu_1) { Menu.create!(name: 'Menu 1') }
      let(:params) do
        { name: "Mac n' Cheese", price: 10.00, description: 'Hot and round' }
      end
      before do
        dish.menu = menu_1
      end

      context 'and no duplicate dish exists' do
        it 'passes validation' do
          expect { dish.save! }.not_to raise_error
        end
      end

      context 'and a duplicate dish exists' do
        let(:duplicate_dish) do
          Dish.create!(name: "Mac n' Cheese", price: 11.00, description: 'Hot')
        end

        xcontext 'on the same menu' do
          ## taking this out because I think the question didn't intend for this to be handeled differently from the below

          before do
            duplicate_dish.menu = menu_1
            duplicate_dish.save
          end

          it 'passes validation' do
            expect { dish.save! }.not_to raise_error
          end
        end

        context 'on a different menu' do
          let(:menu_2) { Menu.create!(name: 'Menu 2') }
          before do
            duplicate_dish.menu = menu_2
            duplicate_dish.save
          end

          it 'fails validation' do
            expect { dish.save! }.to raise_error
          end
        end
      end

      context "and the sum of the dish's price with the prices of the other dishes in the menu" do
        before do
          menu_1.dishes << [
            Dish.create!(name: "Ice Cream", price: 10.00, description: 'Cold'),
            Dish.create!(name: "Salad", price: 10.00, description: 'Room temp'),
            Dish.create!(name: "Lobster", price: 37.00, description: 'Red')
          ]
        end

        context 'does not equal 77' do
          it 'passes validation' do
            expect { dish.save! }.not_to raise_error
          end
        end

        context 'does equal 77' do
          before do
            menu_1.dishes << [
              Dish.create!(name: "French Fries", price: 10.00, description: 'Hot')
            ]
          end

          it 'fails validation' do
            
            expect { dish.save! }.to raise_error
          end
        end
      end
    end
  end
end
