import 'dart:convert';

List<Quran> quranFromJson(String str) =>
    List<Quran>.from(json.decode(str).map((x) => Quran.fromJson(x)));

String quranToJson(List<Quran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quran {
  String? arti;
  String? asma;
  int? ayat;
  String? nama;
  String? type;
  int? urut;
  String? audio;
  int? nomor;
  int? rukuk;
  String? keterangan;

  Quran({
    this.arti,
    this.asma,
    this.ayat,
    this.nama,
    this.type,
    this.urut,
    this.audio,
    this.nomor,
    this.rukuk,
    this.keterangan,
  });

  factory Quran.fromJson(Map<String, dynamic> json) => Quran(
        arti: json["arti"],
        asma: json["asma"],
        ayat: int.tryParse(json["ayat"].toString()),
        nama: json["nama"],
        type: json["type"],
        urut: int.tryParse(json["urut"].toString()),
        audio: json["audio"],
        nomor: int.tryParse(json["nomor"].toString()),
        rukuk: int.tryParse(json["rukuk"].toString()),
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "arti": arti,
        "asma": asma,
        "ayat": ayat,
        "nama": nama,
        "type": type,
        "urut": urut,
        "audio": audio,
        "nomor": nomor,
        "rukuk": rukuk,
        "keterangan": keterangan,
      };
}
