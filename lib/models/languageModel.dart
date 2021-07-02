class LanguageModel {
  String _name;
  String _code;

  LanguageModel({String name, String code}) {
    this._name = name;
    this._code = code;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get code => _code;
  set code(String code) => _code = code;

  LanguageModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['code'] = this._code;
    return data;
  }
}
