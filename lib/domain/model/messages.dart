import 'dart:convert';
/// id : "string"
/// accountId : "string"
/// msgid : "string"
/// from : {"address":"from@example.com","name":"John Doe"}
/// to : [{"address":"receiver@example.com","name":"John Doe"}]
/// subject : "string"
/// intro : "string"
/// seen : true
/// isDeleted : true
/// hasAttachments : true
/// size : 0
/// downloadUrl : "string"
/// createdAt : "2023-07-15T20:47:59.594Z"
/// updatedAt : "2023-07-15T20:47:59.594Z"

Messages messagesFromJson(String str) => Messages.fromJson(json.decode(str));
String messagesToJson(Messages data) => json.encode(data.toJson());
class Messages {
  Messages({
      String? id, 
      String? accountId, 
      String? msgid, 
      From? from, 
      List<To>? to, 
      String? subject, 
      String? intro, 
      bool? seen, 
      bool? isDeleted, 
      bool? hasAttachments, 
      int? size, 
      String? downloadUrl, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _accountId = accountId;
    _msgid = msgid;
    _from = from;
    _to = to;
    _subject = subject;
    _intro = intro;
    _seen = seen;
    _isDeleted = isDeleted;
    _hasAttachments = hasAttachments;
    _size = size;
    _downloadUrl = downloadUrl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Messages.fromJson(dynamic json) {
    _id = json['id'];
    _accountId = json['accountId'];
    _msgid = json['msgid'];
    _from = json['from'] != null ? From.fromJson(json['from']) : null;
    if (json['to'] != null) {
      _to = [];
      json['to'].forEach((v) {
        _to?.add(To.fromJson(v));
      });
    }
    _subject = json['subject'];
    _intro = json['intro'];
    _seen = json['seen'];
    _isDeleted = json['isDeleted'];
    _hasAttachments = json['hasAttachments'];
    _size = json['size'];
    _downloadUrl = json['downloadUrl'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _accountId;
  String? _msgid;
  From? _from;
  List<To>? _to;
  String? _subject;
  String? _intro;
  bool? _seen;
  bool? _isDeleted;
  bool? _hasAttachments;
  int? _size;
  String? _downloadUrl;
  String? _createdAt;
  String? _updatedAt;
Messages copyWith({  String? id,
  String? accountId,
  String? msgid,
  From? from,
  List<To>? to,
  String? subject,
  String? intro,
  bool? seen,
  bool? isDeleted,
  bool? hasAttachments,
  int? size,
  String? downloadUrl,
  String? createdAt,
  String? updatedAt,
}) => Messages(  id: id ?? _id,
  accountId: accountId ?? _accountId,
  msgid: msgid ?? _msgid,
  from: from ?? _from,
  to: to ?? _to,
  subject: subject ?? _subject,
  intro: intro ?? _intro,
  seen: seen ?? _seen,
  isDeleted: isDeleted ?? _isDeleted,
  hasAttachments: hasAttachments ?? _hasAttachments,
  size: size ?? _size,
  downloadUrl: downloadUrl ?? _downloadUrl,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get accountId => _accountId;
  String? get msgid => _msgid;
  From? get from => _from;
  List<To>? get to => _to;
  String? get subject => _subject;
  String? get intro => _intro;
  bool? get seen => _seen;
  bool? get isDeleted => _isDeleted;
  bool? get hasAttachments => _hasAttachments;
  int? get size => _size;
  String? get downloadUrl => _downloadUrl;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['accountId'] = _accountId;
    map['msgid'] = _msgid;
    if (_from != null) {
      map['from'] = _from?.toJson();
    }
    if (_to != null) {
      map['to'] = _to?.map((v) => v.toJson()).toList();
    }
    map['subject'] = _subject;
    map['intro'] = _intro;
    map['seen'] = _seen;
    map['isDeleted'] = _isDeleted;
    map['hasAttachments'] = _hasAttachments;
    map['size'] = _size;
    map['downloadUrl'] = _downloadUrl;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}

/// address : "receiver@example.com"
/// name : "John Doe"

To toFromJson(String str) => To.fromJson(json.decode(str));
String toToJson(To data) => json.encode(data.toJson());
class To {
  To({
      String? address, 
      String? name,}){
    _address = address;
    _name = name;
}

  To.fromJson(dynamic json) {
    _address = json['address'];
    _name = json['name'];
  }
  String? _address;
  String? _name;
To copyWith({  String? address,
  String? name,
}) => To(  address: address ?? _address,
  name: name ?? _name,
);
  String? get address => _address;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['name'] = _name;
    return map;
  }

}

/// address : "from@example.com"
/// name : "John Doe"

From fromFromJson(String str) => From.fromJson(json.decode(str));
String fromToJson(From data) => json.encode(data.toJson());
class From {
  From({
      String? address, 
      String? name,}){
    _address = address;
    _name = name;
}

  From.fromJson(dynamic json) {
    _address = json['address'];
    _name = json['name'];
  }
  String? _address;
  String? _name;
From copyWith({  String? address,
  String? name,
}) => From(  address: address ?? _address,
  name: name ?? _name,
);
  String? get address => _address;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['name'] = _name;
    return map;
  }

}