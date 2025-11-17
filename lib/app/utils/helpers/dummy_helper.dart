import 'package:koperasi_sekar_kartini_mobile_app/app/models/event_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/group_member_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/models/user_model.dart';
import 'package:koperasi_sekar_kartini_mobile_app/app/types/enum/role_enum.dart';

class DummyHelper {
  static final List<UserModel> dummyUsers = [
    UserModel(
      id: 'USER-001',
      name: 'Raka Febrian',
      role: RoleEnum.admin,
      nomorAnggota: 'AGT-001',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UserModel(
      id: 'USER-002',
      name: 'Siti Rahma',
      role: RoleEnum.groupMember,
      nomorAnggota: 'AGT-002',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UserModel(
      id: 'USER-003',
      name: 'Taufik Hidayat',
      role: RoleEnum.admin,
      nomorAnggota: 'AGT-003',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UserModel(
      id: 'USER-004',
      name: 'Dewi Kartika',
      role: RoleEnum.groupMember,
      nomorAnggota: 'AGT-004',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UserModel(
      id: 'USER-005',
      name: 'Bagas Saputra',
      role: RoleEnum.admin,
      nomorAnggota: 'AGT-005',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    UserModel(
      id: 'USER-006',
      name: 'Siti Aminah',
      role: RoleEnum.employee,
      nomorAnggota: 'AGT-006',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  static final List<EventModel> dummyEvents = [
    EventModel(
      id: 'EVENT-01',
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
      image: 'https://example.com/images/event_rapat_tahunan.jpg',
      user: dummyUsers[1],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    EventModel(
      id: 'EVENT-02',
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
      image: 'https://example.com/images/event_pelatihan_keuangan.jpg',
      user: dummyUsers[2],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    EventModel(
      id: 'EVENT-03',
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
      image: 'https://example.com/images/event_baksos.jpg',
      user: dummyUsers[3],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    EventModel(
      id: 'EVENT-04',
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
      image: 'https://example.com/images/event_workshop_digital.jpg',
      user: dummyUsers[4],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    EventModel(
      id: 'EVENT-05',
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
      image: 'https://example.com/images/event_family_gathering.jpg',
      user: dummyUsers[5],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    EventModel(
      id: 'EVENT-06',
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
      user: dummyUsers[5],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  static final dummyGroupMembers = <GroupMemberModel>[
    GroupMemberModel(
      id: 'GROUP-MEMBER-01',
      isActive: true,
      note: 'Anggota aktif dengan kontribusi rutin.',
      user: dummyUsers[0],
      group: 'b91c27fe-1234-4f56-98ab-77889900ccdd',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    GroupMemberModel(
      id: 'GROUP-MEMBER-02',
      isActive: false,
      note: 'Status nonaktif karena tidak hadir 3 bulan.',
      user: dummyUsers[1],
      group: 'b91c27fe-1234-4f56-98ab-77889900ccdd',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    GroupMemberModel(
      id: 'GROUP-MEMBER-03',
      isActive: true,
      note: 'Ketua kelompok.',
      user: dummyUsers[2],
      group: 'e98f11aa-2233-44bb-8899-0022446688ff',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    GroupMemberModel(
      id: 'GROUP-MEMBER-04',
      isActive: true,
      note: 'Anggota aktif dengan kontribusi rutin.',
      user: dummyUsers[3],
      group: 'e98f11aa-2233-44bb-8899-0022446688ff',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
}
