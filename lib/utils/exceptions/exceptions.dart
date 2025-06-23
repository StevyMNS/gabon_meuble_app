/// Exception class for handling various errors.
class GMExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const GMExceptions([
    this.message = 'An unexpected error occurred. Please try again.',
  ]);

  /// Create an authentication exception from a Firebase authentication exception code.
  factory GMExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const GMExceptions(
          'The email address is already registered. Please use a different email.',
        );
      case 'invalid-email':
        return const GMExceptions(
          'The email address provided is invalid. Please enter a valid email.',
        );
      case 'weak-password':
        return const GMExceptions(
          'The password is too weak. Please choose a stronger password.',
        );
      case 'user-disabled':
        return const GMExceptions(
          'This user account has been disabled. Please contact support for assistance.',
        );
      case 'user-not-found':
        return const GMExceptions('Invalid login details. User not found.');
      case 'wrong-password':
        return const GMExceptions(
          'Incorrect password. Please check your password and try again.',
        );
      case 'INVALID_LOGIN_CREDENTIALS':
        return const GMExceptions(
          'Invalid login credentials. Please double-check your information.',
        );
      case 'too-many-requests':
        return const GMExceptions('Too many requests. Please try again later.');
      case 'invalid-argument':
        return const GMExceptions(
          'Invalid argument provided to the authentication method.',
        );
      case 'invalid-password':
        return const GMExceptions('Incorrect password. Please try again.');
      case 'invalid-phone-number':
        return const GMExceptions('The provided phone number is invalid.');
      case 'operation-not-allowed':
        return const GMExceptions(
          'The sign-in provider is disabled for your Firebase project.',
        );
      case 'session-cookie-expired':
        return const GMExceptions(
          'The Firebase session cookie has expired. Please sign in again.',
        );
      case 'uid-already-exists':
        return const GMExceptions(
          'The provided user ID is already in use by another user.',
        );
      case 'sign_in_failed':
        return const GMExceptions('Sign-in failed. Please try again.');
      case 'network-request-failed':
        return const GMExceptions(
          'Network request failed. Please check your internet connection.',
        );
      case 'internal-error':
        return const GMExceptions('Internal error. Please try again later.');
      case 'invalid-verification-code':
        return const GMExceptions(
          'Invalid verification code. Please enter a valid code.',
        );
      case 'invalid-verification-id':
        return const GMExceptions(
          'Invalid verification ID. Please request a new verification code.',
        );
      case 'quota-exceeded':
        return const GMExceptions('Quota exceeded. Please try again later.');
      default:
        return const GMExceptions();
    }
  }
}
