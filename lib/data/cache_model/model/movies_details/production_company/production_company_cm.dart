import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'production_company_cm.g.dart';

@HiveType(typeId: 2)
class ProductionCompanyCM extends Equatable {
  const ProductionCompanyCM(this.name, this.originCountry);

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String originCountry;

  @override
  List<Object?> get props => [
        name,
        originCountry,
      ];
}
