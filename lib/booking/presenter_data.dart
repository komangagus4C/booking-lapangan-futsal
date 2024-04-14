class nanam {
  // Attributes
  late int _id;
  late String _nama_tanaman;
  late String _jenis_tanaman;
  late String _tanggal_menanam;

  // Constructor
  nanam(
      this._id, this._nama_tanaman, this._jenis_tanaman, this._tanggal_menanam);

  // Named Constructor fromMap
  nanam.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama_tanaman = map['nama_tanaman'].toString();
    this._jenis_tanaman = map['jenis_tanaman'].toString();
    this._tanggal_menanam = map['tanggal_menanam'].toString();
  }

  // Getter methods
  int get id => _id;
  String get nama_tanaman => _nama_tanaman;
  String get jenis_tanaman => _jenis_tanaman;
  String get tanggal_menanam => _tanggal_menanam;

  // Setter methods
  set nama_tanaman(String value) {
    _nama_tanaman = value;
  }

  set jenis_tanaman(String value) {
    _jenis_tanaman = value;
  }

  set tanggal_menanam(String value) {
    _tanggal_menanam = value;
  }

  // Convert object attributes to Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama_tanaman'] = nama_tanaman;
    map['jenis_tanaman'] = jenis_tanaman;
    map['tanggal_menanam'] = tanggal_menanam;
    return map;
  }
}
