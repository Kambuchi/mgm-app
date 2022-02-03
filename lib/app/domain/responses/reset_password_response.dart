stringToResetPasswordResponse(String text) {
  switch (text) {
    case "network-request-failed":
      return ResetPasswordResponse.networkRequestFailed;
    case "user-disabled":
      return ResetPasswordResponse.userDisabled;
    case "user-not-found":
      return ResetPasswordResponse.userNotFound;
    case "internal-error":
      return ResetPasswordResponse.tooManyRequests;
    default:
      ResetPasswordResponse.unknown;
  }
}

enum ResetPasswordResponse {
  ok,
  networkRequestFailed,
  userDisabled,
  userNotFound,
  tooManyRequests,
  unknown,
}
