
import '../../../models/response_model.dart';
import '../../../utils/custom_validator.dart';
import 'network_exceptions.dart';
import '../../../views/widget/toast.dart';

class NetworkErrorHelper{
  // ignore: type_annotate_public_apis
  static void handleCustomError(error) {
    if (Validator.isJSON(error)) {
      showErrorToast('${error['error']['message']}');
    } else {
      showErrorToast(NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(error)));
    }
  }

  static void showNetworkMessage(ApiResponse response) {

    if (response.hasData) {
      // customSuccessFlushBar(context, response.data);
      showSuccessToast(response.data);
    } else {
      showErrorToast( response.error);
    }
  }

  static String getErrorMessage(e) {
    return NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e));
  }

}