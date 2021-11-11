import 'package:resik/model/SampahModel.dart';
import 'package:resik/resource/api_provider.dart';

class Repostory {
  final api = ApiProvider();

  Future<GetSampah> getSampahId(String idDesa) => api.getSampahId(idDesa);
}
