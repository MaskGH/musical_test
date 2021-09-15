import 'package:get/get_connect.dart';
import 'package:get/get.dart';
import 'package:musical_app/model/db.dart';
import 'package:musical_app/model/dbs.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class HomeRepository extends GetConnect {
  static HomeRepository get to => Get.find();
  @override
  void onInit() {
    httpClient.baseUrl = "http://kopis.or.kr";
    super.onInit();
  }

  Future<DbsResult?> loadAll() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/pblprfr?service=dbff58b54814479fb5a4e38345f9894d&stdate=20210801&eddate=20220101&cpage=1&rows=30&prfstate=01";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["dbs"] != null && jsonData["dbs"].length > 0) {
          return DbsResult.fromJson(jsonData["dbs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<DbsResult?> loadMusicals() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/pblprfr?service=dbff58b54814479fb5a4e38345f9894d&stdate=20210801&eddate=20220301&cpage=1&rows=100&shcate=AAAB&prfstate=02";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["dbs"] != null && jsonData["dbs"].length > 0) {
          return DbsResult.fromJson(jsonData["dbs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<DbsResult?> loadTheater() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/pblprfr?service=dbff58b54814479fb5a4e38345f9894d&stdate=20210801&eddate=20220301&cpage=1&rows=30&shcate=AAAA&prfstate=02";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["dbs"] != null && jsonData["dbs"].length > 0) {
          return DbsResult.fromJson(jsonData["dbs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Boxofs?> loadNumberBest() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/boxoffice?service=dbff58b54814479fb5a4e38345f9894d&ststype=day&catecode=&date=20210901";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["boxofs"] != null && jsonData["boxofs"].length > 0) {
          return Boxofs.fromJson(jsonData["boxofs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Boxofs?> loadMusicalBest() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/boxoffice?service=dbff58b54814479fb5a4e38345f9894d&ststype=week&catecode=AAAB&date=20210910";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["boxofs"] != null && jsonData["boxofs"].length > 0) {
          return Boxofs.fromJson(jsonData["boxofs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Boxofs?> loadTheaterBest() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/boxoffice?service=dbff58b54814479fb5a4e38345f9894d&ststype=week&catecode=AAAA&date=20210910";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["boxofs"] != null && jsonData["boxofs"].length > 0) {
          return Boxofs.fromJson(jsonData["boxofs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Boxofs?> loadClassicBest() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/boxoffice?service=dbff58b54814479fb5a4e38345f9894d&ststype=week&catecode=CCCA&date=20210910";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["boxofs"] != null && jsonData["boxofs"].length > 0) {
          return Boxofs.fromJson(jsonData["boxofs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Boxofs?> loadOperaBest() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/boxoffice?service=dbff58b54814479fb5a4e38345f9894d&ststype=week&catecode=CCCB&date=20210910";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["boxofs"] != null && jsonData["boxofs"].length > 0) {
          return Boxofs.fromJson(jsonData["boxofs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Boxofs?> loadDanceBest() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/boxoffice?service=dbff58b54814479fb5a4e38345f9894d&ststype=week&catecode=BBBA&date=20210910";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["boxofs"] != null && jsonData["boxofs"].length > 0) {
          return Boxofs.fromJson(jsonData["boxofs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Boxofs?> loadKoreaClassicBest() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/boxoffice?service=dbff58b54814479fb5a4e38345f9894d&ststype=week&catecode=CCCC&date=20210910";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["boxofs"] != null && jsonData["boxofs"].length > 0) {
          return Boxofs.fromJson(jsonData["boxofs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Boxofs?> loadKidBest() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/boxoffice?service=dbff58b54814479fb5a4e38345f9894d&ststype=week&catecode=KID&date=20210910";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["boxofs"] != null && jsonData["boxofs"].length > 0) {
          return Boxofs.fromJson(jsonData["boxofs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Boxofs?> loadOpenRunBest() async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/boxoffice?service=dbff58b54814479fb5a4e38345f9894d&ststype=week&catecode=OPEN&date=20210910";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["boxofs"] != null && jsonData["boxofs"].length > 0) {
          return Boxofs.fromJson(jsonData["boxofs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<DB?> loadMusicalDetail(String? mt20id) async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/pblprfr/$mt20id?service=dbff58b54814479fb5a4e38345f9894d";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["dbs"] != null && jsonData["dbs"].length > 0) {
          Map<String, dynamic?> data = jsonData["dbs"];
          // return DB.fromJson(jsonData['dbs']);
          return DB.fromJson(data['db']);          
        }
      }
    } catch (e) {
      print(e);
    }
  }


  Future<DbsResult?> searchLoad(String searchKeyword) async {
    try {
      Xml2Json xml2json = Xml2Json();
      String url =
          "/openApi/restful/pblprfr?service=dbff58b54814479fb5a4e38345f9894d&stdate=20210801&eddate=20220101&cpage=1&rows=30&prfstate=02&shprfnm=$searchKeyword";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final xml = response.body;
        final xml2json = Xml2Json()..parse(xml);
        final jsondbs = xml2json.toParker();
        final jsonData = json.decode(jsondbs);
        if (jsonData["dbs"] != null && jsonData["dbs"].length > 0) {
          return DbsResult.fromJson(jsonData["dbs"]);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
