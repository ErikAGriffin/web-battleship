require 'board'

describe Board do

  let(:board) {Board.new}
  let(:ship) {double :ship, size: 2, orientation: :vertical, sunk?: false, hit: nil, placed?: false, place: nil}

  it 'has a grid' do
    expect(board.grid.count).to eq 100
  end

  it 'returns SEA when asked a coordinate' do
    coord = :A1
    expect(board.cell(coord)).to eq :SEA
  end

  it "returns nil when passed an incorrect coordinate" do
    coord = :A11
    expect(board.cell(coord)).to eq nil
    coord = :K1
    expect(board.cell(coord)).to eq nil
  end

  it "a vertical ship can be placed within its grid" do
    ship = double :ship, size: 5,  orientation: :vertical, placed?: false, place: nil
    origin = :E1
    board.place(ship, origin)
    expect(board.cell(:D1)).to eq ship
    expect(board.cell(:C1)).to eq ship
    expect(board.cell(:B1)).to eq ship
    expect(board.cell(:A1)).to eq ship
    expect(board.cell(:A2)).to eq :SEA
  end

  it 'a vertical ship will not place if its size puts it outside the bounds' do
    ship = double :ship, size: 5,  orientation: :vertical, placed?: false, place: nil
    origin = :D1
    board.place(ship, origin)
    expect(board.cell(origin)).to eq :SEA
  end

  it 'a horizontal ship can be placed within its grid' do
    ship = double :ship, size: 5,  orientation: :horizontal, placed?: false, place: nil
    origin = :A6
    board.place(ship, origin)
    expect(board.cell(:A6)).to eq ship
    expect(board.cell(:A7)).to eq ship
    expect(board.cell(:A8)).to eq ship
    expect(board.cell(:A9)).to eq ship
    expect(board.cell(:A10)).to eq ship
    expect(board.cell(:B10)).to eq :SEA

  end

  it 'a horizontal ship will not place if its size puts it outside the bounds' do
    ship = double :ship, size: 5,  orientation: :horizontal, placed?: false, place: nil
    origin = :A7
    board.place(ship, origin)
    expect(board.cell(origin)).to eq :SEA
  end

  describe 'Mechanics' do

    it 'will process a shot taken, returning :MISS if miss' do
      origin = :A1
      expect(board.shoot(origin)).to eq :MISS
      expect(board.cell(origin)).to eq :SEA
    end

    it 'will process a shot taken, returning :HIT if hit' do
      origin = :E5
      board.place(ship, origin)
      expect(board.shoot(origin)).to eq :HIT
    end

    it 'will change a cell from ship to hit if a ship is hit' do
      origin = :E5
      board.place(ship, origin)
      board.shoot(origin)
      expect(board.cell(:D5)).to eq ship
      expect(board.cell(origin)).to eq :HIT
      expect(board.cell(:A1)).to eq :SEA
    end

    it 'will process a shot taken, returning :DUPL if cell has already been hit' do
      origin = :E5
      board.place(ship, origin)
      board.shoot(origin)
      expect(board.shoot(origin)).to eq :DUPL
    end

    it 'will increment hits on any ship that is hit' do
      origin = :E5
      board.place(ship,origin)
      expect(ship).to receive(:hit)
      board.shoot(origin)
    end



  end


end
