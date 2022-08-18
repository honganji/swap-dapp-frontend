class SendModel {
  String _symbol = "";
  String _name = "";
  String _imagePath = "";
  String get symbol => _symbol;
  String get name => _name;
  String get imagePath => _imagePath;

  SendModel({
    required String symbol,
    required String name,
    required String imagePath,
  })  : _symbol = symbol,
        _name = name,
        _imagePath = imagePath;
}
