class DbsResult {
  List<Db>? db;

  DbsResult({this.db});

  factory DbsResult.fromJson(Map<String, dynamic> json) =>
      DbsResult(db: List<Db>.from(json["db"].map((x) => Db.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "db": List<dynamic>.from(db!.map((e) => e.toJson())),
      };
}

class Db {
  String? mt20id;
  String? prfnm;
  String? prfpdfrom;
  String? prfpdto;
  String? fcltynm;
  String? poster;
  String? genrenm;
  String? prfstate;
  String? openrun;

  Db({
    this.mt20id,
    this.prfnm,
    this.prfpdfrom,
    this.prfpdto,
    this.fcltynm,
    this.poster,
    this.genrenm,
    this.prfstate,
    this.openrun,
  });

  factory Db.fromJson(Map<String, dynamic> json) => Db(
        mt20id: json["mt20id"],
        prfnm: json["prfnm"],
        prfpdfrom: json["prfpdfrom"],
        prfpdto: json["prfpdto"],
        fcltynm: json["fcltynm"],
        poster: json["poster"],
        genrenm: json["genrenm"],
        prfstate: json["prfstate"],
        openrun: json["openrun"],
      );
  Map<String, dynamic> toJson() => {
        "mt20id": mt20id,
        "prfnm": prfnm,
        "prfpdfrom": prfpdfrom,
        "prfpdto": prfpdto,
        "fcltynm": fcltynm,
        "poster": poster,
        "genrenm": genrenm,
        "prfstate": prfstate,
        "openrun": openrun,
      };
}
