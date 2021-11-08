import 'package:hive/hive.dart';
part 'production_company_cm.g.dart';

@HiveType(typeId: 2)
class ProductionCompanyCM{
  ProductionCompanyCM(this.name, this.originCountry);

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String originCountry;

}
