import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/errors/failures.dart';
import '../../models/product_model.dart';
import 'product_list_ds.dart';

class ProductRemoteDSImpl implements ProductRemoteDS {
  ApiManager apiManager;

  ProductRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      Response response =
          await apiManager.getData(endPoint: EndPoints.products, data: null);
      ProductModel productModel = ProductModel.fromJson(response.data);

      return Right(productModel);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
