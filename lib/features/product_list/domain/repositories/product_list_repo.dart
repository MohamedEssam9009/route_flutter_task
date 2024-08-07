import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/product_model.dart';

abstract class ProductListRepo {
  Future<Either<Failures, ProductModel>> getProductList();
}
