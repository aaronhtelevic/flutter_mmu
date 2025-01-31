class Delegate {
  String id;
  String nam;
  String fnam;
  String? mnam;
  String pic;
  Title ti;
  Bio bio;
  List<String> grp;
  int remst;
  int totst;
  int warst;
  bool enst;
  bool downst;
  String uid;
  int stat;
  String? unam;
  String? pw;
  String pin;

  Delegate({
    required this.id,
    required this.nam,
    required this.fnam,
    required this.mnam,
    required this.pic,
    required this.ti,
    required this.bio,
    required this.grp,
    required this.remst,
    required this.totst,
    required this.warst,
    required this.enst,
    required this.downst,
    required this.uid,
    required this.stat,
    required this.unam,
    required this.pw,
    required this.pin,
  });

  factory Delegate.fromJson(Map<String, dynamic> json) {
    return Delegate(
      id: json['id'],
      nam: json['nam'],
      fnam: json['fnam'],
      mnam: json['mnam'],
      pic: json['pic'],
      ti: Title.fromJson(json['ti']),
      bio: Bio.fromJson(json['bio']),
      grp: List<String>.from(json['grp']),
      remst: json['remst'],
      totst: json['totst'],
      warst: json['warst'],
      enst: json['enst'],
      downst: json['downst'],
      uid: json['uid'],
      stat: json['stat'],
      unam: json['unam'],
      pw: json['pw'],
      pin: json['pin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nam': nam,
      'fnam': fnam,
      'mnam': mnam,
      'pic': pic,
      'ti': ti.toJson(),
      'bio': bio.toJson(),
      'grp': grp,
      'remst': remst,
      'totst': totst,
      'warst': warst,
      'enst': enst,
      'downst': downst,
      'uid': uid,
      'stat': stat,
      'unam': unam,
      'pw': pw,
      'pin': pin,
    };
  }
}

class Title {
  List<String> lang;
  List<String> val;

  Title({
    required this.lang,
    required this.val,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      lang: List<String>.from(json['lang']),
      val: List<String>.from(json['val']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lang': lang,
      'val': val,
    };
  }
}

class Bio {
  List<String> lang;
  List<String> val;

  Bio({
    required this.lang,
    required this.val,
  });

  factory Bio.fromJson(Map<String, dynamic> json) {
    return Bio(
      lang: List<String>.from(json['lang']),
      val: List<String>.from(json['val']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lang': lang,
      'val': val,
    };
  }
}
