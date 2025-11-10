import 'package:koperasi_sekar_kartini_mobile_app/app/models/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/role_enum.dart';

class DummyHelper {
  static final List<EventModel> dummyEvents = [
    EventModel(
      id: '1',
      title: 'Rapat Anggota Tahunan',
      description: '''
    [
      {"insert": "Agenda Rapat:\\n", "attributes": {"bold": true}},
      {"insert": "1. Pembukaan\\n2. Laporan Keuangan 2025\\n3. Pembahasan Program 2026\\n4. Pemilihan Pengurus Baru\\n5. Penutupan\\n\\n"},
      {"insert": "Tempat:", "attributes": {"italic": true}},
      {"insert": " Aula Koperasi Sekar Kartini\\n"},
      {"insert": "Waktu:", "attributes": {"italic": true}},
      {"insert": " 09.00 WIB - Selesai\\n"}
    ]
    ''',
      dateTime: DateTime(2025, 12, 5, 9, 0),
      location: 'Aula Koperasi Sekar Kartini',
      imageUrl: 'https://example.com/images/event_rapat_tahunan.jpg',
      user: UserModel(id: 'u1', name: 'Siti Aminah', role: RoleEnum.employee),
    ),
    EventModel(
      id: '2',
      title: 'Pelatihan Keuangan Pribadi',
      description: '''
    [
      {"insert": "Materi Pelatihan:\\n", "attributes": {"bold": true}},
      {"insert": "1. Dasar-dasar Manajemen Keuangan\\n2. Mengatur Anggaran Rumah Tangga\\n3. Tips Menabung Efektif\\n4. Studi Kasus dan Diskusi\\n\\n"},
      {"insert": "Narasumber:", "attributes": {"italic": true}},
      {"insert": " Ibu Ratna Sari, S.E. (Konsultan Keuangan)\\n"}
    ]
    ''',
      dateTime: DateTime(2025, 11, 20, 13, 30),
      location: 'Ruang Serbaguna Lt. 2',
      imageUrl: 'https://example.com/images/event_pelatihan_keuangan.jpg',
      user: UserModel(id: 'u2', name: 'Raka Febrian', role: RoleEnum.employee),
    ),
    EventModel(
      id: '3',
      title: 'Bakti Sosial Akhir Tahun',
      description: '''
    [
      {"insert": "Kegiatan Bakti Sosial:\\n", "attributes": {"bold": true}},
      {"insert": "1. Pembagian Sembako\\n2. Pemeriksaan Kesehatan Gratis\\n3. Donor Darah\\n\\n"},
      {"insert": "Lokasi:", "attributes": {"italic": true}},
      {"insert": " Kantor Desa Karanganyar\\n"},
      {"insert": "Jam:", "attributes": {"italic": true}},
      {"insert": " 08.00 WIB\\n"}
    ]
    ''',
      dateTime: DateTime(2025, 12, 28, 8, 0),
      location: 'Kantor Desa Karanganyar',
      imageUrl: 'https://example.com/images/event_baksos.jpg',
      user: UserModel(id: 'u3', name: 'Indah Permata', role: RoleEnum.employee),
    ),
    EventModel(
      id: '4',
      title: 'Workshop Digital Marketing',
      description: '''
    [
      {"insert": "Rundown Workshop:\\n", "attributes": {"bold": true}},
      {"insert": "1. Pengenalan Digital Marketing\\n2. Strategi Media Sosial\\n3. Praktik Optimasi Konten\\n4. Tanya Jawab\\n\\n"},
      {"insert": "Pemateri:", "attributes": {"italic": true}},
      {"insert": " Bapak Agus Santoso, M.M. (Digital Strategist)\\n"}
    ]
    ''',
      dateTime: DateTime(2026, 1, 10, 10, 0),
      location: 'Balai Pertemuan Kota',
      imageUrl: 'https://example.com/images/event_workshop_digital.jpg',
      user: UserModel(id: 'u4', name: 'Agus Santoso', role: RoleEnum.employee),
    ),
    EventModel(
      id: '5',
      title: 'Family Gathering Koperasi',
      description: '''
    [
      {"insert": "Susunan Acara:\\n", "attributes": {"bold": true}},
      {"insert": "1. Registrasi Peserta\\n2. Games dan Outbound\\n3. Makan Siang Bersama\\n4. Doorprize dan Hiburan\\n5. Penutupan\\n\\n"},
      {"insert": "Lokasi:", "attributes": {"italic": true}},
      {"insert": " Taman Wisata Alam Sumber Ria\\n"},
      {"insert": "Dresscode:", "attributes": {"italic": true}},
      {"insert": " Kaos Putih & Celana Jeans\\n"}
    ]
    ''',
      dateTime: DateTime(2026, 2, 14, 7, 30),
      location: 'Taman Wisata Alam Sumber Ria',
      imageUrl: 'https://example.com/images/event_family_gathering.jpg',
      user: UserModel(id: 'u5', name: 'Dewi Kartika', role: RoleEnum.employee),
    ),
    EventModel(
      id: 'ID-KEGIATAN-1',
      title: 'Syukuran Rumah Baru Bu Nurul',
      description: '''
      [
        { "insert": "Rundown:\\n", "attributes": { "bold": true } },
        { "insert": "1. Pembukaan\\n2. Pembacaan Yasin\\n3. Ramah Tamah\\n4. Foto Bersama\\n5. Penutup\\n" },
        { "insert": "\\n" },
        { "insert": "Tempat:", "attributes": { "italic": true } },
        { "insert": " Rumah Bu Nurul\\n" }
      ]
    ''',
      dateTime: DateTime(2025, 11, 8, 20, 0, 0),
      location: 'Jl. Melati no.05, Kec. Patrang, Kab. Jember',
      user: UserModel(
        id: 'ID-USER-1',
        name: 'Raka Febrian',
        role: RoleEnum.admin,
      ),
    )
  ];
}
