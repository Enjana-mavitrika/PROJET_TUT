var formElt = document.getElementById("inscription");
var nomElt = document.getElementById("nom");
var prenomElt = document.getElementById("prenom");
var mailElt = document.getElementById("mail");
var phoneElt = document.getElementById("phone");
var password_1Elt = document.getElementById("password_1");
var password_2Elt = document.getElementById("password_2");


/* verifier nom */
verifierInput(nomElt, "nom valide", "nom invalide", verifierNomPrenom);

/* verifier prenom */
verifierInput(prenomElt, "prenom valide", "prenom invalide", verifierNomPrenom);

/* verifier mail */
verifierInput(mailElt, "adresse mail valide", "adresse mail invalide", verifierMail);

/* verifier phone */
verifierInput(phoneElt, "numéro de téléphone valide", "numéro de téléphone invalide", verifierPhone);

/* verifier password 1 */
verifierInput(password_1Elt, "mot de passe valide", "le mot de passe doit contenir 8 caractères au minimum et composés d'au moins un caractère spécial(*!?()/#'&@$^:`) et d'au moins un chiffre et au moins une lettre en majuscule et en minuscule", verifierSoliditePass);

/* verifierCorrespondance password 1 et password 2 */
verifierCorrespondancePass(password_1Elt, password_2Elt, "mot de passe valide", "Les mots de passe ne correspondent pas", verifierCorrespondancePass_aux);

/* verifier inscription */
verifierInscription(formElt, nomElt, prenomElt, mailElt, phoneElt, password_1Elt, password_2Elt, "Veillez remplir le formulaire correctement");







