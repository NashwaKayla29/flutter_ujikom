class jahit {
  bool? success;
  String? message;
  List<Data>? data;

  jahit({this.success, this.message, this.data});

  jahit.fromJson(Map<String, dynamic> json) {
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
  String? namaBarang;
  int? potongId;
  int? pegawaiId;
  String? tanggalJahit;
  String? lolos;
  String? cacat;
  String? createdAt;
  String? updatedAt;
  Potong? potong;
  DataPegawai? dataPegawai;

  Data(
      {this.id,
      this.namaBarang,
      this.potongId,
      this.pegawaiId,
      this.tanggalJahit,
      this.lolos,
      this.cacat,
      this.createdAt,
      this.updatedAt,
      this.potong,
      this.dataPegawai});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaBarang = json['nama_barang'];
    potongId = json['potong_id'];
    pegawaiId = json['pegawai_id'];
    tanggalJahit = json['tanggal_jahit'];
    lolos = json['lolos'];
    cacat = json['cacat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    potong =
        json['potong'] != null ? new Potong.fromJson(json['potong']) : null;
    dataPegawai = json['data_pegawai'] != null
        ? new DataPegawai.fromJson(json['data_pegawai'])
        : null;
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
    if (this.potong != null) {
      data['potong'] = this.potong!.toJson();
    }
    if (this.dataPegawai != null) {
      data['data_pegawai'] = this.dataPegawai!.toJson();
    }
    return data;
  }
}

class Potong {
  int? id;
  int? bahanId;
  String? hasilPotongPola;
  int? jumlahPotong;
  String? tanggalPotong;
  String? createdAt;
  String? updatedAt;

  Potong(
      {this.id,
      this.bahanId,
      this.hasilPotongPola,
      this.jumlahPotong,
      this.tanggalPotong,
      this.createdAt,
      this.updatedAt});

  Potong.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bahanId = json['bahan_id'];
    hasilPotongPola = json['hasil_potong_pola'];
    jumlahPotong = json['jumlah_potong'];
    tanggalPotong = json['tanggal_potong'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bahan_id'] = this.bahanId;
    data['hasil_potong_pola'] = this.hasilPotongPola;
    data['jumlah_potong'] = this.jumlahPotong;
    data['tanggal_potong'] = this.tanggalPotong;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DataPegawai {
  int? id;
  String? namaPegawai;
  String? createdAt;
  String? updatedAt;

  DataPegawai({this.id, this.namaPegawai, this.createdAt, this.updatedAt});

  DataPegawai.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPegawai = json['nama_pegawai'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_pegawai'] = this.namaPegawai;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
