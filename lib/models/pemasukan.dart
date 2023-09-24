class Pemasukan {
  int? _id;
  late DateTime _tanggal;
  late int _nominal;
  late String _keterangan;

  // konstruktor versi 1
  Pemasukan(this._tanggal, this._nominal, this._keterangan);

  // konstruktor versi 2: konversi dari Map ke Pemasukan
  Pemasukan.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._tanggal = map['tanggal'];
    this._nominal = map['nominal'];
    this._keterangan = map['keterangan'];
  }
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id!;
  DateTime get tanggal => _tanggal;
  int get nominal => _nominal;
  String get keterangan => _keterangan;

  // setter
  set tanggal(DateTime value) {
    _tanggal = value;
  }

  set nominal(int value) {
    _nominal = value;
  }

  set keterangan(String value) {
    _keterangan = value;
  }

  // konversi dari Pemasukan ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['tanggal'] = tanggal;
    map['nominal'] = nominal;
    map['keterangan'] = keterangan;
    return map;
  }
}
