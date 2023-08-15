// import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/core/core.dart';
import 'package:mothercare_mobile/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

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
