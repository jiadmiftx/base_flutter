import 'dart:developer';

import 'package:pgn_mobile/core/helpers/secure_storage/storage_helper.dart';

class RoleHelper {
  Future<bool> getRoleAccess(String value) async {
    var dataPermission = await storage.getRolePermission;

    List<String> elements = dataPermission?.substring(1, dataPermission.length - 1).split(',') ?? [];

    List<String> listAccessPermissions = elements.map((element) => element.trim()).toList();

    log(listAccessPermissions.first);

    return listAccessPermissions.contains(value);
  }

  Future<List<String>> getListAccess() async {
    var dataPermission = await storage.getRolePermission;

    List<String> elements = dataPermission?.substring(1, dataPermission.length - 1).split(',') ?? [];

    List<String> listAccessPermissions = elements.map((element) => element.trim()).toList();

    // log("list access $listAccessPermissions");
    return listAccessPermissions;
  }
}

final roleHelper = RoleHelper();
