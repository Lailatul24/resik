import 'package:resik/model/SampahModel.dart';
import 'package:resik/resource/repostory.dart';
import 'package:rxdart/rxdart.dart';


class HomeController {
  final repostory = Repostory();

  final _sampahFetchar = PublishSubject<GetSampah>();
  
 

  PublishSubject<GetSampah> get resSampah => _sampahFetchar;

  void getSampahId(String idDesa) async {
    try {
      GetSampah sampahModel = await repostory.getSampahId(idDesa);
      _sampahFetchar.sink.add(sampahModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void dispose() {
    _sampahFetchar.close();
    
  }
}
