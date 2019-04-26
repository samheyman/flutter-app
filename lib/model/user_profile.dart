// use the enumeration FitnessLevel in order to avoid errors on the initialization of objects
enum FitnessLevel {
  beginner,
  intermediate,
  advanced,
}

class UserProfile {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final FitnessLevel fitnessLevel;
  final DateTime dueDate;

  UserProfile.fromMap(Map<String, dynamic> data, String id)
    : this(
      id: id,  
      firstName: data['firstName'],
      lastName: data['lastName'],
      dueDate: DateTime.fromMicrosecondsSinceEpoch((data['dueDate'].microsecondsSinceEpoch)),
      fitnessLevel: FitnessLevel.values[data['fitnessLevel']],
    );

  const UserProfile(
    {
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.fitnessLevel,
      this.dueDate,
    }
  );
}

