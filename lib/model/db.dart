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

class Boxofs {
  List<Boxof>? boxof;

  Boxofs({this.boxof});

  factory Boxofs.fromJson(Map<String, dynamic> json) => Boxofs(
      boxof: List<Boxof>.from(json["boxof"].map((x) => Boxof.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "boxof": List<dynamic>.from(boxof!.map((e) => e.toJson())),
      };
}

class Boxof {
  String? area;
  String? prfdtcnt;
  String? prfpd;
  String? cate;
  String? prfplcnm;
  String? prfnm;
  String? rnum;
  String? seatcnt;
  String? poster;
  String? mt20id;

  Boxof({
    this.area,
    this.prfdtcnt,
    this.prfpd,
    this.cate,
    this.prfplcnm,
    this.prfnm,
    this.rnum,
    this.seatcnt,
    this.poster,
    this.mt20id,
  });

  factory Boxof.fromJson(Map<String, dynamic> json) => Boxof(
        area: json["area"],
        prfdtcnt: json["prfdtcnt"],
        prfpd: json["prfpd"],
        cate: json["cate"],
        prfplcnm: json["prfplcnm"],
        prfnm: json["prfnm"],
        rnum: json["rnum"],
        seatcnt: json["seatcnt"],
        poster: json["poster"],
        mt20id: json["mt20id"],
      );
  Map<String, dynamic> toJson() => {
        "area": area,
        "prfdtcnt": prfdtcnt,
        "prfpd": prfpd,
        "cate": cate,
        "prfplcnm": prfplcnm,
        "prfnm": prfnm,
        "rnum": rnum,
        "seatcnt": seatcnt,
        "poster": poster,
        "mt20id": mt20id,
      };
}
