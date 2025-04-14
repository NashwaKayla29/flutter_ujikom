class qc {
  bool? success;
  String? message;
  List<Data>? data;

  qc({this.success, this.message, this.data});

  qc.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? qcId;
  int? jahitId;
  String? lolosQc;
  String? cacatJual;
  String? cacatPermanen;
  String? createdAt;
  String? updatedAt;
  Jahit? jahit;
  DataQc? dataQc;

  Data(
      {this.id,
      this.qcId,
      this.jahitId,
      this.lolosQc,
      this.cacatJual,
      this.cacatPermanen,
      this.createdAt,
      this.updatedAt,
      this.jahit,
      this.dataQc});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qcId = json['qc_id'];
    jahitId = json['jahit_id'];
    lolosQc = json['lolos_Qc'];
    cacatJual = json['cacat_jual'];
    cacatPermanen = json['cacat_permanen'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    jahit = json['jahit'] != null ? new Jahit.fromJson(json['jahit']) : null;
    dataQc =
        json['data_qc'] != null ? new DataQc.fromJson(json['data_qc']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qc_id'] = this.qcId;
    data['jahit_id'] = this.jahitId;
    data['lolos_Qc'] = this.lolosQc;
    data['cacat_jual'] = this.cacatJual;
    data['cacat_permanen'] = this.cacatPermanen;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.jahit != null) {
      data['jahit'] = this.jahit!.toJson();
    }
    if (this.dataQc != null) {
      data['data_qc'] = this.dataQc!.toJson();
    }
    return data;
  }
}

class Jahit {
  int? id;
  String? namaBarang;
  int? potongId;
  int? pegawaiId;
  String? tanggalJahit;
  String? lolos;
  String? cacat;
  String? createdAt;
  String? updatedAt;

  Jahit(
      {this.id,
      this.namaBarang,
      this.potongId,
      this.pegawaiId,
      this.tanggalJahit,
      this.lolos,
      this.cacat,
      this.createdAt,
      this.updatedAt});

  Jahit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaBarang = json['nama_barang'];
    potongId = json['potong_id'];
    pegawaiId = json['pegawai_id'];
    tanggalJahit = json['tanggal_jahit'];
    lolos = json['lolos'];
    cacat = json['cacat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_barang'] = this.namaBarang;
    data['potong_id'] = this.potongId;
    data['pegawai_id'] = this.pegawaiId;
    data['tanggal_jahit'] = this.tanggalJahit;
    data['lolos'] = this.lolos;
    data['cacat'] = this.cacat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DataQc {
  int? id;
  String? namaQc;
  String? createdAt;
  String? updatedAt;

  DataQc({this.id, this.namaQc, this.createdAt, this.updatedAt});

  DataQc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaQc = json['nama_Qc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_Qc'] = this.namaQc;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
