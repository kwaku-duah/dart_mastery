class SpaceCraft {
  String name;
  DateTime? launchDate;

  //Read-only non-final property
  int? get launchYear => launchDate?.year;

// constructor with syntactic sugar for assignment
SpaceCraft(this.name, this.launchDate) {
  //initialization code goes here
}

  //Named constructor that forwards to the default one
  SpaceCraft.unlaunched(String name) : this(name, null);

//Method
void describe() {
  print('SpaceCraft: $name');

  //type promotion does not work on getters
  var launchDate = this.launchDate;
  if (launchDate != null) {
    int years = DateTime.now().difference(launchDate).inDays ~/ 365;
    print('Launched: $launchYear ($years years ago)');
  } else {
    print('Unlaunched');
  }
}
}

void main() {
  var voyager = SpaceCraft('Voyager 1', DateTime(1977, 5, 9));
  voyager.describe();

  var voyager2 = SpaceCraft.unlaunched('Voyager III');
  voyager2.describe();
}