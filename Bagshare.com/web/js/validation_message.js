var formElt = document.getElementById("message");
var prenomElt = document.getElementById("prenom-message");
var mailElt = document.getElementById("mail-message");
var messageElt = document.getElementById("contenu-message");

/* verifier prenom */
verifierInput(prenomElt, "prenom valide", "prenom invalide", verifierNomPrenom);

/* verifier mail */
verifierInput(mailElt, "mail valide", "mail invalide", verifierMail);

/* verifier contenu message */
verifierInput(messageElt, "message valide", "message invalide", verifierContenuMessage);

/* verifier message */
verifierMessage(formElt, prenomElt, mailElt, messageElt, "Veillez compléter correctement le formulaire");