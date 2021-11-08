import 'package:json_annotation/json_annotation.dart';
part 'production_company_rm.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompanyRM {
  ProductionCompanyRM(this.name, this.originCountry);

  factory ProductionCompanyRM.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyRMFromJson(json);

  final String name;
  final String originCountry;

  Map<String, dynamic> toJson() => _$ProductionCompanyRMToJson(this);
}
