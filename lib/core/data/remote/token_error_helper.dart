/// Author:    Nabraj Khadka
/// Created:   17.01.2022
/// Description:
/// (c) Copyright by Fantagious.com.
///*/


enum TokenErrorType {
  refreshTokenHasExpired,
  failedToRegenerateAccessToken,
  invalidAccessToken,
  tokenNotFound,
}



extension UIErrorExtension on TokenErrorType {
  String get description {
    switch (this) {
      case TokenErrorType.refreshTokenHasExpired:
        return 'Refresh Token Has Expired';
      case TokenErrorType.failedToRegenerateAccessToken:
        return 'Failed to Regenerate Access Token';
      case TokenErrorType.invalidAccessToken:
        return 'Invalid access token. Logging out user..';
      case TokenErrorType.tokenNotFound:
        return 'Token not found';
      default:
        return 'Unexpected error occurred while refreshing token';
    }

  }
}
