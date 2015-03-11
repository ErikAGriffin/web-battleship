require './app/model/player'

describe 'Player' do

  # Player is currently allowed to place opponents ships.
  # This might not matter as I believe the GameMaster will be offering
  # the ships to each player to place, rather than the player accessing
  # them directly.


  let(:board) {double :board, place: true}
  let(:player) {Player.new(board: board)}
  let(:ship) {double :ship}

  it 'has its home board' do
    expect(player.board).to eq board
  end

  it 'can change a ships orientation, before placement' do
    expect(ship).to receive(:change_orientation)
    player.rotate(ship)
  end

  it 'can place ships on home board' do
    origin = [1,:B]
    expect(board).to receive(:place).with(ship, origin).and_return(true)
    player.place(ship, origin)
  end




end
