require 'game'

describe 'Game' do

  let(:p1ship) {double :ship, sunk?: false}
  let(:p2ship) {double :ship, sunk?: false}
  let(:p1board) {double :board}
  let(:p2board) {double :board}
  let(:player1) {double :player, homeboard: p1board}
  let(:player2) {double :player, homeboard: p2board}
  let(:game) {Game.new(players: [player1,player2], ships:[{ship1: p1ship},{ship2: p2ship}])}

  let(:origin) {[1,:B]}

  it 'initializes with 2 players' do
    expect(game.player1).to eq player1
    expect(game.player2).to eq player2
  end

  it 'knows who the active_player is' do
    expect(game.active_player).to eq player1
  end

  it 'can switch active_player' do
    game.send(:switch_active_player)
    expect(game.active_player).to eq player2
  end

  describe 'Handling Shots:' do

    it 'can send a shot to opponents board' do
      expect(p2board).to receive(:shoot).with(origin)
      game.shoot(origin)
    end

    it "returns 'Cap'n! We missed!!' if the shot returns a :MISS" do
      allow(p2board).to receive(:shoot).with(origin).and_return(:MISS)
      expect(game.shoot(origin)).to eq "Cap'n! We missed!!"
    end

    it "returns 'DIRECT HIT!! Well done sir!' if the shot returns a :HIT" do
      allow(p2board).to receive(:shoot).with(origin).and_return(:HIT)
      expect(game.shoot(origin)).to eq "DIRECT HIT!! Well done sir!"
    end

    it "returns 'Blast we wasted that shot. You've already fired on that location!' if the shot returns :DUPL" do
      allow(p2board).to receive(:shoot).with(origin).and_return(:DUPL)
      expect(game.shoot(origin)).to eq "Blast we wasted that shot. You've already fired on that location!"
    end

  end

  describe 'Handling Ships' do

    it 'has ships for each player' do
      expect(game.p1ships).to eq({ship1: p1ship})
      expect(game.p2ships).to eq({ship2: p2ship})
    end

  end

  describe 'Rules' do

    it 'checks for a winner after each shot' do
      allow(p2board).to receive(:shoot).with(origin).and_return(:HIT)
      expect(game).to receive(:game_over?)
      game.shoot(origin)
    end

    it 'will declare active_player the winner if all the opponents ships are sunk' do
      # This test is faulty.  Ships hash can't actually receive sunk?

      allow(p2board).to receive(:shoot).with(origin).and_return(:HIT)
      allow(p2ship).to receive(:sunk?).and_return(true)
      expect(game.shoot(origin)).to eq "DIRECT HIT!! Cap'n you've done it!! The enemy is defeated"
    end

  end








end
