class Cota {
  USDBRL? uSDBRL;
  USDBRL? eURBRL;
  USDBRL? gBPBRL;
  USDBRL? aRSBRL;
  USDBRL? uYUBRL;

  Cota({this.uSDBRL, this.eURBRL, this.gBPBRL, this.aRSBRL, this.uYUBRL});

  Cota.fromJson(Map<String, dynamic> json) {
    uSDBRL =
        json['USDBRL'] != null ? new USDBRL.fromJson(json['USDBRL']) : null;
    eURBRL =
        json['EURBRL'] != null ? new USDBRL.fromJson(json['EURBRL']) : null;
    gBPBRL =
        json['GBPBRL'] != null ? new USDBRL.fromJson(json['GBPBRL']) : null;
    aRSBRL =
        json['ARSBRL'] != null ? new USDBRL.fromJson(json['ARSBRL']) : null;
    uYUBRL =
        json['UYUBRL'] != null ? new USDBRL.fromJson(json['UYUBRL']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uSDBRL != null) {
      data['USDBRL'] = this.uSDBRL!.toJson();
    }
    if (this.eURBRL != null) {
      data['EURBRL'] = this.eURBRL!.toJson();
    }
    if (this.gBPBRL != null) {
      data['GBPBRL'] = this.gBPBRL!.toJson();
    }
    if (this.aRSBRL != null) {
      data['ARSBRL'] = this.aRSBRL!.toJson();
    }
    if (this.uYUBRL != null) {
      data['UYUBRL'] = this.uYUBRL!.toJson();
    }
    return data;
  }
}

class USDBRL {
  String? code;
  String? codein;
  String? name;
  String? high;
  String? low;
  String? varBid;
  String? pctChange;
  String? bid;
  String? ask;
  String? timestamp;
  String? createDate;

  USDBRL(
      {this.code,
      this.codein,
      this.name,
      this.high,
      this.low,
      this.varBid,
      this.pctChange,
      this.bid,
      this.ask,
      this.timestamp,
      this.createDate});

  USDBRL.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    codein = json['codein'];
    name = json['name'];
    high = json['high'];
    low = json['low'];
    varBid = json['varBid'];
    pctChange = json['pctChange'];
    bid = json['bid'];
    ask = json['ask'];
    timestamp = json['timestamp'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['codein'] = this.codein;
    data['name'] = this.name;
    data['high'] = this.high;
    data['low'] = this.low;
    data['varBid'] = this.varBid;
    data['pctChange'] = this.pctChange;
    data['bid'] = this.bid;
    data['ask'] = this.ask;
    data['timestamp'] = this.timestamp;
    data['create_date'] = this.createDate;
    return data;
  }
}
