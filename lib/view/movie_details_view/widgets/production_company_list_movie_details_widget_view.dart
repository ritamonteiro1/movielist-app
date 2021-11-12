import 'package:flutter/material.dart';
import 'package:teste_tokenlab/domain/movie_details/production_company/production_company.dart';
import 'package:teste_tokenlab/generated/l10n.dart';

class ProductionCompanyListMovieDetailsWidgetView extends StatelessWidget {
  const ProductionCompanyListMovieDetailsWidgetView({
    required this.productionCompanyList,
    Key? key,
  }) : super(key: key);
  final List<ProductionCompany> productionCompanyList;

  @override
  Widget build(BuildContext context) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productionCompanyList.length,
        itemBuilder: (context, index) => Center(
          child: Column(
            children: [
              Text('${S.of(context).productionCompanyListViewName} '
                  '${productionCompanyList[index].name}'),
              Text('${S.of(context).productionCompanyCountry} '
                  '${productionCompanyList[index].originCountry}'),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      );
}
