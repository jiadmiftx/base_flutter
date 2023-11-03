// import 'package:pgn_mobile/features/ektp/ektp.dart';
import 'package:pgn_mobile/core/core.dart';

getColorStatus(String status) {
  switch (status) {
    case 'permohonan':
      return BaseColor.colorPermohonan;
    case 'diproses':
      return BaseColor.colorProses;
    case 'selesai':
      return BaseColor.colorSelesai;
    case 'mohon diperbaiki':
      return BaseColor.colorMohonperbaiki;
    case 'ditolak':
      return BaseColor.colorDitolak;
    case 'verifikasi':
      return BaseColor.colorVerifikasi;
    default:
      return BaseColor.colorProses;
  }
}

getGender(String gender) {
  switch (gender) {
    case 'P':
      return 'Perempuan';
    case 'L':
      return 'Laki-Laki';
    default:
      return 'Laki-laki';
  }
}
