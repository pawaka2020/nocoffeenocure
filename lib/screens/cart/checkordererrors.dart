
import '../../common.dart';

bool checkOrderErrors(bool tracking) {
  if (tracking == true) {
    printToast("Error: Order already exists");
    return false;
  }



  return true;
}