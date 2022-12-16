import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_blog/model/request_register.dart';
import 'package:get/get.dart';
import 'package:my_blog/util/save/key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UtilTool {

  ///更新用户信息，需要保存密码
  ///[userInfo] 用户信息
  static notifyUserInfo(UserEntity userInfo){
    var oldInfo = getUserInfo();
    if(oldInfo != null){
      userInfo.password = oldInfo.password;
    }
    UtilTool.deleteUserInfo();
    UtilTool.putUserInfo(userInfo);
  }

  ///删除存储用户信息
  static deleteUserInfo() {
    Get.find<SharedPreferences>().remove(KeyTool.keyUserInfo);
  }

  ///存储用户信息
  ///[userInfo] 用户信息
  static putUserInfo(UserEntity userInfo) {
    Get.find<SharedPreferences>()
        .setString(KeyTool.keyUserInfo, jsonEncode(userInfo.toJson()));
  }

  ///获取用户信息
  ///[UserEntity] 用户信息
  static UserEntity? getUserInfo() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getString(KeyTool.keyUserInfo);
      if (json == null) {
        return null;
      } else {
        return UserEntity.fromJson(jsonDecode(json));
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}