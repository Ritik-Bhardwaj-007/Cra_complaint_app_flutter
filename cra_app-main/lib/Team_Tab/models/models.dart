class DataModel {
  final String position;
  final String imageName;
  final String name;
  DataModel(
    this.position,
    this.imageName,
    this.name,
  );
}

List<DataModel> dataList = [
  DataModel("Hostel Secretary", 'assets/images/naman.jpeg', "Naman Yadav"),
  DataModel(
      "Maintenance Secretary", 'assets/images/uday.jpeg', "Uday Gaidhane"),
  DataModel("Mess Secretary", 'assets/images/udit.jpeg', "Udit Agrawal"),
  DataModel("Game Developer", 'assets/images/arvind.jpeg', "Arvind Sharma"),
];
