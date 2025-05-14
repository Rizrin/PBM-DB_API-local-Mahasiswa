class Organisasi {
  String? nim;
  String? nama;
  String? nama_organisasi;
  String? thn_bergabung;
  Organisasi({this.nim, this.nama, this.nama_organisasi, this.thn_bergabung});
  factory Organisasi.fromJson(Map<String, dynamic> json) => Organisasi(
        nim: json['nim'],
        nama: json['nama'],
        nama_organisasi: json['nama organisasi'],
        thn_bergabung: json['tahun bergabung'],
      );
  Map<String, dynamic> toJson() => {
        'nim': nim,
        'nama': nama,
        'nama organisasi': nama_organisasi,
        'tahun bergabung': thn_bergabung,
      };
}
