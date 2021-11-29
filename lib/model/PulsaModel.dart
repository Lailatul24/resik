class OperationModel {
  String? name;

  OperationModel(this.name);
}

List<OperationModel> datas =
    operationsData.map((item) => OperationModel(item['name'])).toList();

var operationsData = [
  {"name": "7.000"},
  {"name": "12.000"},
  {"name": "20.000"},
  {"name": "32.000"},
  {"name": "52.000"},
  {"name": "102.000"}
];
