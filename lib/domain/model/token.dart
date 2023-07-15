import 'dart:convert';
/// token : "string"

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));
String tokenToJson(Token data) => json.encode(data.toJson());
class Token {
  Token({
      String? token,}){
    _token = token;
}

  Token.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
Token copyWith({  String? token,
}) => Token(  token: token ?? _token,
);
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}