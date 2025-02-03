class DelegateComm {
  String nam = 'delinfo';
  List<Group> groups;
  List<Delegate> delegates;
  List<Unit> units;

  DelegateComm({
    required this.groups,
    required this.delegates,
    required this.units,
  });

  factory DelegateComm.fromJson(Map<String, dynamic> json) {
    return DelegateComm(
      groups: List<Group>.from(json['g'].map((group) => Group.fromJson(group))),
      delegates: List<Delegate>.from(
          json['d'].map((delegate) => Delegate.fromJson(delegate))),
      units: List<Unit>.from(json['u'].map((unit) => Unit.fromJson(unit))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nam': nam,
      'g': groups.map((group) => group.toJson()).toList(),
      'd': delegates.map((delegate) => delegate.toJson()).toList(),
      'u': units.map((unit) => unit.toJson()).toList(),
    };
  }
}

class Unit {
  String id;
  String nam;
  int stat;
  String del;

  Unit({
    required this.id,
    required this.nam,
    required this.stat,
    required this.del,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'],
      nam: json['nam'],
      stat: json['stat'],
      del: json['del'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nam': nam,
      'stat': stat,
      'del': del,
    };
  }
}

class GroupNam {
  List<String> lang;
  List<String> val;

  GroupNam({
    required this.lang,
    required this.val,
  });

  factory GroupNam.fromJson(Map<String, dynamic> json) {
    return GroupNam(
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

class Group {
  String id;
  String col;
  GroupNam nam;
  List<String> del;
  String pic;
  int remst;
  int totst;
  int warst;
  bool enst;
  bool downst;

  Group({
    required this.id,
    required this.col,
    required this.nam,
    required this.del,
    required this.pic,
    required this.remst,
    required this.totst,
    required this.warst,
    required this.enst,
    required this.downst,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      col: json['col'],
      nam: GroupNam.fromJson(json['nam']),
      del: List<String>.from(json['del']),
      pic: json['pic'],
      remst: json['remst'],
      totst: json['totst'],
      warst: json['warst'],
      enst: json['enst'],
      downst: json['downst'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'col': col,
      'nam': nam.toJson(),
      'del': del,
      'pic': pic,
      'remst': remst,
      'totst': totst,
      'warst': warst,
      'enst': enst,
      'downst': downst,
    };
  }
}

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
