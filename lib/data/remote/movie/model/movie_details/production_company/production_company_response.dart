import 'package:json_annotation/json_annotation.dart';
part 'production_company_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductionCompanyResponse {
  ProductionCompanyResponse(this.name, this.originCountry);

  factory ProductionCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyResponseFromJson(json);

  final String name;
  final String originCountry;

  Map<String, dynamic> toJson() => _$ProductionCompanyResponseToJson(this);
}
