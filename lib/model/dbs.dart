// class DBs {
//   // DB? db;

//   // DBs({this.db});

//   // factory DBs.fromJson(Map<String, dynamic> json) =>
//   //     DBs(db: json['db']);

//   // Map<String, dynamic> toJson() => {
//   //       "db": db,
//   //     };
//   List<DB>? db;
//   DBs({this.db});

//   factory DBs.fromJson(Map<String, dynamic> json) =>
//       DBs(db: List<DB>.from(json["db"].map((x) => DB.fromJson(x))));

//   Map<String, dynamic> toJson() => {
//         "db": List<dynamic>.from(db!.map((e) => e.toJson())),
//       };
// }

class DB {
  String? mt20id;
  String? prfnm;
  String? prfpdfrom;
  String? prfpdto;
  String? prfcast;
  String? prfruntime;
  String? prfage;
  String? entrpsnm;
  String? pcseguidance;
  String? poster;
  String? sty;
  String? genrenm;
  String? prfstate;
  String? openrun;
  String? dtguidance;
  List<Styurls>? styurls;
  String? mt10id;
  String? prfcrew;
  String? fcltynm;

  DB(
      {this.mt20id,
      this.prfnm,
      this.prfpdfrom,
      this.prfpdto,
      this.prfcast,
      this.prfruntime,
      this.prfage,
      this.entrpsnm,
      this.pcseguidance,
      this.poster,
      this.sty,
      this.genrenm,
      this.prfstate,
      this.openrun,
      this.dtguidance,
      this.styurls,
      this.mt10id,
      this.prfcrew,
      this.fcltynm});

  factory DB.fromJson(Map<String, dynamic> json) => DB(
        mt20id: json["mt20id"],
        prfnm: json["prfnm"],
        prfpdfrom: json["prfpdfrom"],
        prfpdto: json["prfpdto"],
        prfcast: json["prfcast"],
        prfruntime: json["prfruntime"],
        prfage: json["prfage"],
        entrpsnm: json["entrpsnm"],
        pcseguidance: json["pcseguidance"],
        poster: json["poster"],
        sty: json["sty"],
        genrenm: json["genrenm"],
        prfstate: json["prfstate"],
        openrun: json["openrun"],
        dtguidance: json["dtguidance"],
        mt10id: json['mt10id'],
        prfcrew: json['prfcrew'],
        fcltynm: json['fcltynm'],
        // styurls:
        //     List<Styurls>.from(json["styurl"].map((x) => Styurls.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mt20id": mt20id,
        "prfnm": prfnm,
        "prfpdfrom": prfpdfrom,
        "prfpdto": prfpdto,
        "prfcast": prfcast,
        "prfruntime": prfruntime,
        "prfage": prfage,
        "entrpsnm": entrpsnm,
        "pcseguidance": pcseguidance,
        "poster": poster,
        "sty": sty,
        "genrenm": genrenm,
        "prfstate": prfstate,
        "openrun": openrun,
        "dtguidance": dtguidance,
        "mt10id": mt10id,
        "prfcrew": prfcrew,
        "fcltynm": fcltynm,
        "styurls": List<dynamic>.from(styurls!.map((e) => e.toJson())),
      };
}
// factory DbsResult.fromJson(Map<String, dynamic> json) =>
//       DbsResult(db: List<Db>.from(json["db"].map((x) => Db.fromJson(x))));

//   Map<String, dynamic> toJson() => {
//         "db": List<dynamic>.from(db!.map((e) => e.toJson())),
//       };

class Styurls {
  String? styurl;

  Styurls({this.styurl});

  factory Styurls.fromJson(Map<String, dynamic> json) => Styurls(
        styurl: json["styurl"],
      );
  Map<String, dynamic> toJson() => {"styurl": styurl};

}
