class ProductionCompanyResponse {
  ProductionCompanyResponse(this.name, this.originCountry);

  ProductionCompanyResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    originCountry = json['origin_country'];
  }

  late final String? name;
  late final String? originCountry;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }
}
