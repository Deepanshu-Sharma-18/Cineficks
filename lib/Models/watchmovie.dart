// To parse this JSON data, do
//
//     final watchProvider = watchProviderFromJson(jsonString);

import 'dart:convert';

WatchProvider watchProviderFromJson(String str) =>
    WatchProvider.fromJson(json.decode(str));

String watchProviderToJson(WatchProvider data) => json.encode(data.toJson());

class WatchProvider {
  WatchProvider({
    this.id,
    this.results,
  });

  int? id;
  Results? results;

  factory WatchProvider.fromJson(Map<String, dynamic> json) => WatchProvider(
        id: json["id"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": results?.toJson(),
      };
}

class Results {
  Results({
    this.ar,
    this.at,
    this.au,
    this.be,
    this.br,
    this.ca,
    this.ch,
    this.cl,
    this.co,
    this.cz,
    this.de,
    this.dk,
    this.ec,
    this.ee,
    this.es,
    this.fi,
    this.fr,
    this.gb,
    this.gr,
    this.hu,
    this.id,
    this.ie,
    this.resultsIn,
    this.it,
    this.jp,
    this.kr,
    this.lt,
    this.lv,
    this.mx,
    this.my,
    this.nl,
    this.no,
    this.nz,
    this.pe,
    this.ph,
    this.pl,
    this.pt,
    this.ro,
    this.ru,
    this.se,
    this.sg,
    this.th,
    this.tr,
    this.us,
    this.ve,
    this.za,
  });

  Ar? ar;
  Ar? at;
  Ar? au;
  Ar? be;
  Ar? br;
  Ar? ca;
  Ar? ch;
  Ar? cl;
  Ar? co;
  Ar? cz;
  Ar? de;
  Ar? dk;
  Ar? ec;
  Ar? ee;
  Ar? es;
  Ar? fi;
  Ar? fr;
  Ar? gb;
  Ar? gr;
  Ar? hu;
  Ar? id;
  Ar? ie;
  Ar? resultsIn;
  Ar? it;
  Ar? jp;
  Ar? kr;
  Ar? lt;
  Ar? lv;
  Ar? mx;
  Ar? my;
  Ar? nl;
  Ar? no;
  Ar? nz;
  Ar? pe;
  Ar? ph;
  Ar? pl;
  Ar? pt;
  Ro? ro;
  Ar? ru;
  Ar? se;
  Ar? sg;
  Ar? th;
  Ar? tr;
  Ar? us;
  Ar? ve;
  Ar? za;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        ar: json["AR"] == null ? null : Ar.fromJson(json["AR"]),
        at: json["AT"] == null ? null : Ar.fromJson(json["AT"]),
        au: json["AU"] == null ? null : Ar.fromJson(json["AU"]),
        be: json["BE"] == null ? null : Ar.fromJson(json["BE"]),
        br: json["BR"] == null ? null : Ar.fromJson(json["BR"]),
        ca: json["CA"] == null ? null : Ar.fromJson(json["CA"]),
        ch: json["CH"] == null ? null : Ar.fromJson(json["CH"]),
        cl: json["CL"] == null ? null : Ar.fromJson(json["CL"]),
        co: json["CO"] == null ? null : Ar.fromJson(json["CO"]),
        cz: json["CZ"] == null ? null : Ar.fromJson(json["CZ"]),
        de: json["DE"] == null ? null : Ar.fromJson(json["DE"]),
        dk: json["DK"] == null ? null : Ar.fromJson(json["DK"]),
        ec: json["EC"] == null ? null : Ar.fromJson(json["EC"]),
        ee: json["EE"] == null ? null : Ar.fromJson(json["EE"]),
        es: json["ES"] == null ? null : Ar.fromJson(json["ES"]),
        fi: json["FI"] == null ? null : Ar.fromJson(json["FI"]),
        fr: json["FR"] == null ? null : Ar.fromJson(json["FR"]),
        gb: json["GB"] == null ? null : Ar.fromJson(json["GB"]),
        gr: json["GR"] == null ? null : Ar.fromJson(json["GR"]),
        hu: json["HU"] == null ? null : Ar.fromJson(json["HU"]),
        id: json["ID"] == null ? null : Ar.fromJson(json["ID"]),
        ie: json["IE"] == null ? null : Ar.fromJson(json["IE"]),
        resultsIn: json["IN"] == null ? null : Ar.fromJson(json["IN"]),
        it: json["IT"] == null ? null : Ar.fromJson(json["IT"]),
        jp: json["JP"] == null ? null : Ar.fromJson(json["JP"]),
        kr: json["KR"] == null ? null : Ar.fromJson(json["KR"]),
        lt: json["LT"] == null ? null : Ar.fromJson(json["LT"]),
        lv: json["LV"] == null ? null : Ar.fromJson(json["LV"]),
        mx: json["MX"] == null ? null : Ar.fromJson(json["MX"]),
        my: json["MY"] == null ? null : Ar.fromJson(json["MY"]),
        nl: json["NL"] == null ? null : Ar.fromJson(json["NL"]),
        no: json["NO"] == null ? null : Ar.fromJson(json["NO"]),
        nz: json["NZ"] == null ? null : Ar.fromJson(json["NZ"]),
        pe: json["PE"] == null ? null : Ar.fromJson(json["PE"]),
        ph: json["PH"] == null ? null : Ar.fromJson(json["PH"]),
        pl: json["PL"] == null ? null : Ar.fromJson(json["PL"]),
        pt: json["PT"] == null ? null : Ar.fromJson(json["PT"]),
        ro: json["RO"] == null ? null : Ro.fromJson(json["RO"]),
        ru: json["RU"] == null ? null : Ar.fromJson(json["RU"]),
        se: json["SE"] == null ? null : Ar.fromJson(json["SE"]),
        sg: json["SG"] == null ? null : Ar.fromJson(json["SG"]),
        th: json["TH"] == null ? null : Ar.fromJson(json["TH"]),
        tr: json["TR"] == null ? null : Ar.fromJson(json["TR"]),
        us: json["US"] == null ? null : Ar.fromJson(json["US"]),
        ve: json["VE"] == null ? null : Ar.fromJson(json["VE"]),
        za: json["ZA"] == null ? null : Ar.fromJson(json["ZA"]),
      );

  Map<String, dynamic> toJson() => {
        "AR": ar?.toJson(),
        "AT": at?.toJson(),
        "AU": au?.toJson(),
        "BE": be?.toJson(),
        "BR": br?.toJson(),
        "CA": ca?.toJson(),
        "CH": ch?.toJson(),
        "CL": cl?.toJson(),
        "CO": co?.toJson(),
        "CZ": cz?.toJson(),
        "DE": de?.toJson(),
        "DK": dk?.toJson(),
        "EC": ec?.toJson(),
        "EE": ee?.toJson(),
        "ES": es?.toJson(),
        "FI": fi?.toJson(),
        "FR": fr?.toJson(),
        "GB": gb?.toJson(),
        "GR": gr?.toJson(),
        "HU": hu?.toJson(),
        "ID": id?.toJson(),
        "IE": ie?.toJson(),
        "IN": resultsIn?.toJson(),
        "IT": it?.toJson(),
        "JP": jp?.toJson(),
        "KR": kr?.toJson(),
        "LT": lt?.toJson(),
        "LV": lv?.toJson(),
        "MX": mx?.toJson(),
        "MY": my?.toJson(),
        "NL": nl?.toJson(),
        "NO": no?.toJson(),
        "NZ": nz?.toJson(),
        "PE": pe?.toJson(),
        "PH": ph?.toJson(),
        "PL": pl?.toJson(),
        "PT": pt?.toJson(),
        "RO": ro?.toJson(),
        "RU": ru?.toJson(),
        "SE": se?.toJson(),
        "SG": sg?.toJson(),
        "TH": th?.toJson(),
        "TR": tr?.toJson(),
        "US": us?.toJson(),
        "VE": ve?.toJson(),
        "ZA": za?.toJson(),
      };
}

class Ar {
  Ar({
    this.link,
    this.flatrate,
    this.rent,
    this.buy,
  });

  String? link;
  List<Buy>? flatrate;
  List<Buy>? rent;
  List<Buy>? buy;

  factory Ar.fromJson(Map<String, dynamic> json) => Ar(
        link: json["link"],
        flatrate: json["flatrate"] == null
            ? []
            : List<Buy>.from(json["flatrate"]!.map((x) => Buy.fromJson(x))),
        rent: json["rent"] == null
            ? []
            : List<Buy>.from(json["rent"]!.map((x) => Buy.fromJson(x))),
        buy: json["buy"] == null
            ? []
            : List<Buy>.from(json["buy"]!.map((x) => Buy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "flatrate": flatrate == null
            ? []
            : List<dynamic>.from(flatrate!.map((x) => x.toJson())),
        "rent": rent == null
            ? []
            : List<dynamic>.from(rent!.map((x) => x.toJson())),
        "buy":
            buy == null ? [] : List<dynamic>.from(buy!.map((x) => x.toJson())),
      };
}

class Buy {
  Buy({
    this.displayPriority,
    this.logoPath,
    this.providerId,
    this.providerName,
  });

  int? displayPriority;
  String? logoPath;
  int? providerId;
  String? providerName;

  factory Buy.fromJson(Map<String, dynamic> json) => Buy(
        displayPriority: json["display_priority"],
        logoPath: json["logo_path"],
        providerId: json["provider_id"],
        providerName: json["provider_name"],
      );

  Map<String, dynamic> toJson() => {
        "display_priority": displayPriority,
        "logo_path": logoPath,
        "provider_id": providerId,
        "provider_name": providerName,
      };
}

class Ro {
  Ro({
    this.link,
    this.flatrate,
  });

  String? link;
  List<Buy>? flatrate;

  factory Ro.fromJson(Map<String, dynamic> json) => Ro(
        link: json["link"],
        flatrate: json["flatrate"] == null
            ? []
            : List<Buy>.from(json["flatrate"]!.map((x) => Buy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "flatrate": flatrate == null
            ? []
            : List<dynamic>.from(flatrate!.map((x) => x.toJson())),
      };
}
