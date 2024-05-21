typedef Strategy = double Function(
    List<String> cardOnDesk, List<String> currentHand);

class PokerPlayer {
  List<String> _currentHand = ['King of clubs', 'Nine of hearts'];

  double _surenessInWin = 0;

  void calculateProbabilities(
    List<String> cardOnDesk,
    Strategy strategy,
  ) =>
      _surenessInWin = strategy(cardOnDesk, _currentHand);
}

void main() {
  final opponent = PokerPlayer();

  final Strategy fakeStrategy =
      (List<String> cardOnDesk, List<String> currentHand) {
    print('Карты противника: $cardOnDesk');

    return 0.0;
  };

  opponent.calculateProbabilities(
    ['Nine of diamonds', 'king of hearts'],
    fakeStrategy,
  );
}
