class Student {
  final String lastName, firstName, gender, matricule, training, cohorte, idPc,operation;

  Student({
    required this.lastName,
    required this.firstName,
    required this.gender,
    required this.matricule,
    required this.training,
    required this.cohorte,
    required this.idPc,
    required this.operation
  });


}
 List<Student> myStudents = [
    Student(
      lastName: "DOE ",
      firstName: "John",
      gender: "Masculin",
      matricule: "10015",
      training: "Cyberscurité",
      cohorte: "Cohorte 2",
      idPc: "10-2023",
      operation: "Dépôt"
    ),
    Student(
      lastName: "AMIDOU ",
      firstName: "Kareem",
      gender: "Masculin",
      matricule: "10011",
      training: "10011",
      cohorte: "Cohorte 5",
      idPc: "25-2023",
      operation: "Dépôt"
    ),
    Student(
      lastName: "MOHAMED",
      firstName: "Ali",
      gender: "Feminin",
      matricule: "10012",
      training: "Référent Digital",
      cohorte: "Cohorte 5",
      idPc: "12-2024",
      operation: "Dépôt"
    ),

    Student(
      lastName: "DUPAIN",
      firstName: "Marinette",
      gender: "Feminin",
      matricule: "10014",
      training: "Référent Digital",
      cohorte: "Cohorte 3",
      idPc: "15-2021",
      operation: "Dépôt"
    ),
    Student(
      lastName: "BOURGOIS",
      firstName: "Chloé",
      gender: "Feminin",
      matricule: "10015",
      training: "Cyberscurité",
      cohorte: "Cohorte 1",
      idPc: "17-2023",
      operation: "Dépôt"
    ),

    Student(
      lastName: "M'BAPE",
      firstName: "Kylliane",
      gender: "Feminin",
      matricule: "10016",
      training: "Cyberscurité",
      cohorte: "Cohorte 2",
      idPc: "23-2025",
      operation: "Dépôt"
    ),

    Student(
      lastName: "AGOSSOU",
      firstName: "Esthelle",
      gender: "Feminin",
      matricule: "10017",
      training: "Cyberscurité",
      cohorte: "Cohorte 2",
      idPc: "29-2024",
      operation: "Dépôt"
    ),
  ];