import 'package:equatable/equatable.dart';

class ProductionCompany extends Equatable {
  const ProductionCompany(this.name, this.originCountry);

  final String name;
  final String originCountry;

  @override
  List<Object?> get props => [
        name,
        originCountry,
      ];
}
