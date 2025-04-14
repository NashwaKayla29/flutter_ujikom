class Potong {
  bool? success;
  String? message;
  List<Data>? data;

  Potong({this.success, this.message, this.data});

  Potong.fromJson(Map<String, dynamic> json) {
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
  int? bahanId;
  String? hasilPotongPola;
  int? jumlahPotong;
  String? tanggalPotong;
  String? createdAt;
  String? updatedAt;
  Bahan? bahan;

  Data(
      {this.id,
      this.bahanId,
      this.hasilPotongPola,
      this.jumlahPotong,
      this.tanggalPotong,
      this.createdAt,
      this.updatedAt,
      this.bahan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bahanId = json['bahan_id'];
    hasilPotongPola = json['hasil_potong_pola'];
    jumlahPotong = json['jumlah_potong'];
    tanggalPotong = json['tanggal_potong'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bahan = json['bahan'] != null ? new Bahan.fromJson(json['bahan']) : null;
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
    if (this.bahan != null) {
      data['bahan'] = this.bahan!.toJson();
    }
    return data;
  }
}

class Bahan {
  int? id;
  String? namaBahan;
  String? ukuranBahan;
  String? tanggalMasukBahan;
  String? masaBahan;
  String? yard;
  int? stok;
  int? stokSisa;
  String? keterangan;
  String? createdAt;
  String? updatedAt;

  Bahan(
      {this.id,
      this.namaBahan,
      this.ukuranBahan,
      this.tanggalMasukBahan,
      this.masaBahan,
      this.yard,
      this.stok,
      this.stokSisa,
      this.keterangan,
      this.createdAt,
      this.updatedAt});

  Bahan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaBahan = json['nama_bahan'];
    ukuranBahan = json['ukuran_bahan'];
    tanggalMasukBahan = json['tanggal_masuk_bahan'];
    masaBahan = json['masa_bahan'];
    yard = json['yard'];
    stok = json['stok'];
    stokSisa = json['stok_sisa'];
    keterangan = json['keterangan'];
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
    data['stok_sisa'] = this.stokSisa;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
