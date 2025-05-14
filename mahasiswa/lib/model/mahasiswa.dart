class Mahasiswa {
  String? nim;
  String? nama;
  String? prodi;
  String? fakultas;
  Mahasiswa({this.nim, this.nama, this.prodi, this.fakultas});
  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        nim: json['nim'],
        nama: json['nama'],
        prodi: json['prodi'],
        fakultas: json['fakultas'],
      );
  Map<String, dynamic> toJson() => {
        'nim': nim,
        'nama': nama,
        'prodi': prodi,
        'fakultas': fakultas,
      };
}
