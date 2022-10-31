
import 'package:hive_flutter/hive_flutter.dart';

part 'signup_model.g.dart';

@HiveType(typeId: 1)
class SigUpModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? profession;
  @HiveField(4)
  String? number;
  @HiveField(5)
  String? password;

  SigUpModel({
    this.id,
    required this.email,
    this.name,
    this.number,
    required this.password,
    this.profession,
  });
}
