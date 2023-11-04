class Person
{
  Person({required this.name, required this.age});

  final String name;
  final int age;
}

class PersonViewModel {
  List<Person> persons;
  PersonViewModel(this.persons) {
    if(this.persons == null) {
      persons = [];
    }
  }

  add(Person p) {
    this.persons.add(p);
  }

  remove(Person p) {
    this.persons.remove(p);
  }
}