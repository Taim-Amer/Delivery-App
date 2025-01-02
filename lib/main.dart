import 'package:delivery_app/app.dart';
import 'package:delivery_app/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await TCacheHelper.init();

  runApp(const ClientApp());
}