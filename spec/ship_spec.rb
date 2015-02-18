require 'ship'

describe 'Ship' do

  let(:ship) {Ship.new}


  describe 'Kinds of ships' do

    it 'knows aircraft carriers are size 5' do
      aircraft_carrier = Ship.aircraft_carrier
      expect(aircraft_carrier.size).to eq 5
    end

    it 'knows battleships are of size 4' do
      battleship = Ship.battleship
      expect(battleship.size).to eq 4
    end

    it 'knows submarines are of size 3' do
      submarine = Ship.submarine
      expect(submarine.size).to eq 3
    end

    it 'knows destroyers are of size 3' do
      destroyer = Ship.destroyer
      expect(destroyer.size).to eq 3
    end

    it 'knows patrol boats are of size 2' do
      patrol_boat = Ship.patrol_boat
      expect(patrol_boat.size).to eq 2
    end

  end

  describe "behavior\n" do

    it 'has a name' do
      ship = Ship.aircraft_carrier
      expect(ship.name).to eq 'Aircraft Carrier'
    end

    it 'has a size' do
      expect(ship.size).to eq 1
    end

    it 'knows if its been placed' do
      ship.place
      expect(ship).to be_placed
    end

    it 'has an orientation of vertical upon creation' do
      expect(ship.orientation).to eq :vertical
    end

    it 'can have its orientation changed' do
      ship.change_orientation
      expect(ship.orientation).to eq :horizontal
    end

    it 'will not change orientation after being placed' do
      ship.change_orientation # now horizontal
      ship.place
      ship.change_orientation # trying to make vertical again
      expect(ship.orientation).to eq :horizontal
    end

    it 'can take a hit' do
      ship.hit
      expect(ship.hits).to eq 1
    end

    it 'can float' do
      ship = Ship.new(3)
      ship.hit
      expect(ship).to_not be_sunk
    end

    it 'will sink if hit enough times' do
      ship.size.times {ship.hit}
      expect(ship).to be_sunk
    end



  end























end
