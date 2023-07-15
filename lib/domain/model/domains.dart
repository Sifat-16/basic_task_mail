import 'dart:convert';
/// id : "string"
/// domain : "string"
/// isActive : true
/// isPrivate : true
/// createdAt : "2023-07-15T19:58:06.275Z"
/// updatedAt : "2023-07-15T19:58:06.275Z"

Domains domainsFromJson(String str) => Domains.fromJson(json.decode(str));
String domainsToJson(Domains data) => json.encode(data.toJson());
class Domains {
  Domains({
      String? id, 
      String? domain, 
      bool? isActive, 
      bool? isPrivate, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _domain = domain;
    _isActive = isActive;
    _isPrivate = isPrivate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Domains.fromJson(dynamic json) {
    _id = json['id'];
    _domain = json['domain'];
    _isActive = json['isActive'];
    _isPrivate = json['isPrivate'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _domain;
  bool? _isActive;
  bool? _isPrivate;
  String? _createdAt;
  String? _updatedAt;
Domains copyWith({  String? id,
  String? domain,
  bool? isActive,
  bool? isPrivate,
  String? createdAt,
  String? updatedAt,
}) => Domains(  id: id ?? _id,
  domain: domain ?? _domain,
  isActive: isActive ?? _isActive,
  isPrivate: isPrivate ?? _isPrivate,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get domain => _domain;
  bool? get isActive => _isActive;
  bool? get isPrivate => _isPrivate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['domain'] = _domain;
    map['isActive'] = _isActive;
    map['isPrivate'] = _isPrivate;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}