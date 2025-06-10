import 'package:hive_flutter/hive_flutter.dart';
part 'categorymodel.g.dart';

@HiveType(typeId: 2)
enum categorytype{
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class category{
  @HiveField(0)
  final String id;

   @HiveField(1)
  final String name;

   @HiveField(2)
  final bool isdeleted;

   @HiveField(3)
  final categorytype type;

  category({required this.name,required this.id, required this.type, this.isdeleted=false});
}