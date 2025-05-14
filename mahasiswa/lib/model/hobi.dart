class Hobi {
  String? nim;
  String? nama;
  String? kategori;
  String? deskripsi;
  Hobi({this.nim, this.nama, this.kategori, this.deskripsi});
  factory Hobi.fromJson(Map<String, dynamic> json) => Hobi(
        nim: json['nim'],
        nama: json['nama'],
        kategori: json['kategori'],
        deskripsi: json['deskripsi'],
      );
  Map<String, dynamic> toJson() => {
        'nim': nim,
        'nama': nama,
        'kategori': kategori,
        'deskripsi': deskripsi,
      };
}
