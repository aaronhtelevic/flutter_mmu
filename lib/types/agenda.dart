class AgendaComm {
  String nam;
  Agenda ag;

  AgendaComm({required this.nam, required this.ag});

  factory AgendaComm.fromJson(Map<String, dynamic> json) {
    return AgendaComm(
      nam: json['nam'],
      ag: Agenda.fromJson(json['ag']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nam': nam,
      'ag': ag.toJson(),
    };
  }
}

class AgendaTitle {
  List<String> lang;
  List<String> val;

  AgendaTitle({required this.lang, required this.val});

  factory AgendaTitle.fromJson(Map<String, dynamic> json) {
    return AgendaTitle(
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

class AgendaDescription {
  List<String> lang;
  List<String> val;

  AgendaDescription({required this.lang, required this.val});

  factory AgendaDescription.fromJson(Map<String, dynamic> json) {
    return AgendaDescription(
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

class AgendaItemCStat {
  List<String> lang;
  List<String> val;

  AgendaItemCStat({required this.lang, required this.val});

  factory AgendaItemCStat.fromJson(Map<String, dynamic> json) {
    return AgendaItemCStat(
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

class AgendaItem {
  String id;
  AgendaTitle ti;
  AgendaDescription des;
  String seq;
  int stat;
  AgendaItemCStat cstat;
  bool exp;
  int remt; // remaining time
  int tott; // total time
  int wart; // warning time
  bool ent;
  bool downt;
  List<String> cit;
  List<String> cust;
  List<String> doc;

  AgendaItem({
    required this.id,
    required this.ti,
    required this.des,
    required this.seq,
    required this.stat,
    required this.cstat,
    required this.exp,
    required this.remt,
    required this.tott,
    required this.wart,
    required this.ent,
    required this.downt,
    required this.cit,
    required this.cust,
    required this.doc,
  });

  factory AgendaItem.fromJson(Map<String, dynamic> json) {
    return AgendaItem(
      id: json['id'],
      ti: AgendaTitle.fromJson(json['ti']),
      des: AgendaDescription.fromJson(json['des']),
      seq: json['seq'],
      stat: json['stat'],
      cstat: AgendaItemCStat.fromJson(json['cstat']),
      exp: json['exp'],
      remt: json['remt'],
      tott: json['tott'],
      wart: json['wart'],
      ent: json['ent'],
      downt: json['downt'],
      cit: List<String>.from(json['cit']),
      cust: List<String>.from(json['cust']),
      doc: List<String>.from(json['doc']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ti': ti.toJson(),
      'des': des.toJson(),
      'seq': seq,
      'stat': stat,
      'cstat': cstat.toJson(),
      'exp': exp,
      'remt': remt,
      'tott': tott,
      'wart': wart,
      'ent': ent,
      'downt': downt,
      'cit': cit,
      'cust': cust,
      'doc': doc,
    };
  }
}

class Agenda {
  String id;
  AgendaTitle ti;
  AgendaDescription des;
  List<AgendaItem> it;

  Agenda({
    required this.id,
    required this.ti,
    required this.des,
    required this.it,
  });

  factory Agenda.fromJson(Map<String, dynamic> json) {
    return Agenda(
      id: json['id'],
      ti: AgendaTitle.fromJson(json['ti']),
      des: AgendaDescription.fromJson(json['des']),
      it: (json['it'] as List).map((i) => AgendaItem.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ti': ti.toJson(),
      'des': des.toJson(),
      'it': it.map((i) => i.toJson()).toList(),
    };
  }
}
