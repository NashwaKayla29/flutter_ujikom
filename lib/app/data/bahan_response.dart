class Bahan {
  bool? success;
  String? message;
  List<Data>? data;

  Bahan({this.success, this.message, this.data});

  Bahan.fromJson(Map<String, dynamic> json) {
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
  String? namaBahan;
  String? ukuranBahan;
  String? tanggalMasukBahan;
  String? masaBahan;
  String? yard;
  String? stok;
  String? keterangan;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.namaBahan,
      this.ukuranBahan,
      this.tanggalMasukBahan,
      this.masaBahan,
      this.yard,
      this.stok,
      this.keterangan,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaBahan = json['nama_bahan'];
    ukuranBahan = json['ukuran_bahan'];
    tanggalMasukBahan = json['tanggal_masuk_bahan'];
    masaBahan = json['masa_bahan'];
    yard = json['yard']?.toString(); 
    stok = json['stok']?.toString(); 
    keterangan = json['keterangan']?.toString(); 
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_bahan'] = this.namaBahan;
    data['ukuran_bahan'] = this.ukuranBahan;
    data['tanggal_masuk_bahan'] = this.tanggalMasukBahan;
    data['masa_bahan'] = this.masaBahan;
    data['yard'] = this.yard;
    data['stok'] = this.stok;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
