require 'player'

describe 'Player' do

  # Player is currently allowed to place opponents ships.
  # This might not matter as I believe the GameMaster will be offering
  # the ships to each player to place, rather than the player accessing
  # them directly.


  let(:homeboard) {double :board, place: true}
  let(:player) {Player.new(homeboard: homeboard)}
  let(:ship) {double :ship}

  it 'has its home board' do
    expect(player.homeboard).to eq homeboard
  end

  it 'can change a ships orientation, before placement' do
    expect(ship).to receive(:change_orientation)
    player.rotate(ship)
  end

  it 'can place ships on home board' do
    origin = [1,:B]
    expect(homeboard).to receive(:place).with(ship, origin).and_return(true)
    player.place(ship, origin)
  end




end
