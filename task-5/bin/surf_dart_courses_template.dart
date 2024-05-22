abstract class Person {
  String name;

  Person(this.name);

  void describe() {
    print('Имя: $name');
  }
}

abstract class IPlayer {
  void play();
}

abstract class ICoach {
  void coach();
}

class Gamer extends Person implements IPlayer {
  String team;
  int matchesPlayed;

  Gamer(String name, this.team, this.matchesPlayed) : super(name);

  @override
  void play() {
    print('$name играет за команду $team и сыграл $matchesPlayed матчей.');
  }
}

class Coach extends Person implements ICoach {
  String team;
  int trophiesWon;

  Coach(String name, this.team, this.trophiesWon) : super(name);

  @override
  void coach() {
    print('$name тренирует команду $team и выиграл $trophiesWon трофеев.');
  }
}

class RolePlayer extends Gamer {
  String role;

  RolePlayer(String name, String team, int matchesPlayed, this.role)
      : super(name, team, matchesPlayed);

  @override
  void play() {
    super.play();
    print('$name играет роль $role.');
  }
}

void main() {
  Gamer gamer = Gamer("Александр", "TeamA", 50);
  Coach coach = Coach("Игорь", "TeamA", 10);
  RolePlayer rolePlayer = RolePlayer("Петр", "TeamB", 30, "Снайпер");

  gamer.describe();
  gamer.play();

  coach.describe();
  coach.coach();

  rolePlayer.describe();
  rolePlayer.play();
}
