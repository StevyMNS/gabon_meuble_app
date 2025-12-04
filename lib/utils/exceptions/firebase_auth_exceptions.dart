class GMFirebaseAuthException implements Exception {
  final String code;

  GMFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return "L'adresse e-mail est déjà enregistrée. Veuillez utiliser une autre adresse e-mail.";
      case 'invalid-email':
        return "L'adresse e-mail fournie est invalide. Veuillez saisir une adresse e-mail valide.";
      case 'weak-password':
        return "Le mot de passe est trop faible. Veuillez choisir un mot de passe plus sécurisé.";
      case 'user-disabled':
        return "Ce compte utilisateur a été désactivé. Veuillez contacter le support pour obtenir de l'aide.";
      case 'user-not-found':
        return "Identifiants de connexion invalides. Utilisateur non trouvé.";
      case 'wrong-password':
        return "Mot de passe incorrect. Veuillez vérifier votre mot de passe et réessayer.";
      case 'invalid-verification-code':
        return "Code de vérification invalide. Veuillez saisir un code valide.";
      case 'invalid-verification-id':
        return "ID de vérification invalide. Veuillez demander un nouveau code de vérification.";
      case 'quota-exceeded':
        return "Quota dépassé. Veuillez réessayer plus tard.";
      case 'email-already-exists':
        return "L'adresse e-mail existe déjà. Veuillez utiliser une autre adresse e-mail.";
      case 'provider-already-linked':
        return "Le compte est déjà lié à un autre fournisseur.";
      case 'requires-recent-login':
        return "Cette opération est sensible et nécessite une authentification récente. Veuillez vous reconnecter.";
      case 'credential-already-in-use':
        return "Ces identifiants sont déjà associés à un autre compte utilisateur.";
      case 'user-mismatch':
        return "Les identifiants fournis ne correspondent pas à l'utilisateur précédemment connecté.";
      case 'account-exists-with-different-credential':
        return "Un compte existe déjà avec la même adresse e-mail mais avec des identifiants différents.";
      case 'operation-not-allowed':
        return "Cette opération n'est pas autorisée. Contactez le support pour obtenir de l'aide.";
      case 'expired-action-code':
        return "Le code d'action a expiré. Veuillez demander un nouveau code.";
      case 'invalid-action-code':
        return "Le code d'action est invalide. Veuillez vérifier le code et réessayer.";
      case 'missing-action-code':
        return "Le code d'action est manquant. Veuillez fournir un code valide.";
      case 'user-token-expired':
        return "Le jeton de l'utilisateur a expiré, une authentification est requise. Veuillez vous reconnecter.";
      case 'invalid-credential':
        return "Les identifiants fournis sont invalides ou ont expiré.";
      case 'user-token-revoked':
        return "Le jeton de l'utilisateur a été révoqué. Veuillez vous reconnecter.";
      case 'invalid-message-payload':
        return "Le contenu du message de vérification de l'e-mail est invalide.";
      case 'invalid-sender':
        return "L'expéditeur du modèle d'e-mail est invalide. Veuillez vérifier l'adresse e-mail de l'expéditeur.";
      case 'invalid-recipient-email':
        return "L'adresse e-mail du destinataire est invalide. Veuillez fournir une adresse e-mail valide.";
      case 'missing-iframe-start':
        return "Le modèle d'e-mail est incomplet : balise iframe de début manquante.";
      case 'missing-iframe-end':
        return "Le modèle d'e-mail est incomplet : balise iframe de fin manquante.";
      case 'missing-iframe-src':
        return "Le modèle d'e-mail est incomplet : attribut src de l'iframe manquant.";
      case 'auth-domain-config-required':
        return "La configuration authDomain est requise pour le lien de vérification du code d'action.";
      case 'missing-app-credential':
        return "Les identifiants de l'application sont manquants. Veuillez fournir des identifiants valides.";
      case 'invalid-app-credential':
        return "Les identifiants de l'application sont invalides. Veuillez fournir des identifiants valides.";
      case 'session-cookie-expired':
        return "Le cookie de session Firebase a expiré. Veuillez vous reconnecter.";
      case 'uid-already-exists':
        return "L'identifiant utilisateur fourni est déjà utilisé par un autre utilisateur.";
      case 'invalid-cordova-configuration':
        return "La configuration Cordova fournie est invalide.";
      case 'app-deleted':
        return "Cette instance de FirebaseApp a été supprimée.";
      case 'user-token-mismatch':
        return "Le jeton de l'utilisateur fourni ne correspond pas à l'identifiant de l'utilisateur authentifié.";
      case 'web-storage-unsupported':
        return "Le stockage web n'est pas pris en charge ou est désactivé.";
      case 'app-not-authorized':
        return "L'application n'est pas autorisée à utiliser Firebase Authentication avec la clé API fournie.";
      case 'keychain-error':
        return "Une erreur de trousseau est survenue. Veuillez vérifier le trousseau et réessayer.";
      case 'internal-error':
        return "Une erreur interne d'authentification est survenue. Veuillez réessayer plus tard.";
      case 'INVALID_LOGIN_CREDENTIALS':
        return "Identifiants de connexion invalides.";
      default:
        return "Une erreur d'authentification inattendue est survenue. Veuillez réessayer.";
    }
  }
}
