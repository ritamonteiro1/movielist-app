import 'package:flutter/material.dart';
import 'package:teste_tokenlab/domain/movie_details/production_company/production_company_model.dart';

class ProductionCompanyListViewMovieDetailsWidget extends StatelessWidget {
  const ProductionCompanyListViewMovieDetailsWidget(
      {required this.productionCompanyList, Key? key})
      : super(key: key);
  final List<ProductionCompanyModel> productionCompanyList;

  @override
  Widget build(BuildContext context) => ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productionCompanyList.length,
      itemBuilder: (context, index) => Center(
        child: Column(
          children: [
            Text(
                'Nome: ${productionCompanyList[index].name}'),
            Text(
                'País: ${productionCompanyList[index].originCountry}'),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
}
