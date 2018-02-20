/**
 * fonction pour verifier le format du mail
 */
function verifierMail(mail) {
    var regex = /^[a-zA-Z0-9.-]{2,}@[a-zA-Z0-9.-]{2,}\.[a-z]{2,4}$/i;

    return regex.test(mail);
}

/**
 * fonction pour verifier le format du nom et prenom
 */
function verifierNomPrenom(nomPrenom) {
    var regex = /^[a-zA-Z]{2,15}$/i;
    return regex.test(nomPrenom);
}

/**
 * fonction pour verifier le format du numero de telephone
 */
function verifierPhone(num) {
    var regexFrance = /^0[12345679][0-9]{8}$/i;
    var regexMadagascar = /^0(20|30|32|33|34)[0-9]{7}$/i;
    return (regexFrance.test(num) || regexMadagascar.test(num));
}

/**
 * fonction pour verifier la solidite du mot de passe
 */
function verifierSoliditePass(pass) {
    return (pass.search(/[a-z]/) >= 0 && pass.search(/[0-9]/) >= 0 && pass.search(/[A-Z]/) >= 0 && pass.search(/[',;:"^*?!@+=.&#`()\\/]/) >= 0 && pass.length >= 8);
}

/**
 * fonction pour verifier la correspondance des mots de passe
 */
function verifierCorrespondancePass_aux(pass1, pass2) {
    return (pass1 === pass2);
}

/**
 * fonction pour verifier le message
 */
function verifierContenuMessage(message) {
    return (message.length > 10 && message.length < 1000);
}

/**
 * fonction generique pour afficher aide 
 */
function afficherAide(inputElt, message, couleurMessage, iconeMessage) {
    inputElt.style.borderColor = couleurMessage;
    inputElt.nextElementSibling.style.color = couleurMessage;
    /* ajout icone */
    inputElt.nextElementSibling.innerHTML += iconeMessage + " ";
    /* ajout message */
    inputElt.nextElementSibling.innerHTML += message;

}

function effacerAide(inputElt) {
    inputElt.nextElementSibling.textContent = "";
    inputElt.style.borderColor = "";
}

/**
 * fonction generique pour afficher aide selon situation lors d'un evenement input 
 */
function verifierInput(inputElt, messageSucces, messageErreur, callback) {
    inputElt.addEventListener("input", function (e) {
        effacerAide(e.target);
        if (!callback(e.target.value)) {
            afficherAide(e.target, messageErreur, "#cc0033", '<i class="fa fa-exclamation" aria-hidden="true"></i>');
        } else {
            afficherAide(e.target, messageSucces, "#0f4530", '<i class="fa fa-check" aria-hidden="true"></i>');
        }
    });
}

/**
 * fonction pour verifier la correspondance des mots de passe lors d'un evenement input sur le mots de passe de confirmation
 */
function verifierCorrespondancePass(inputPass1, inputPass2, messageSucces, messageErreur, callback) {
    inputPass2.addEventListener("input", function (e) {
        effacerAide(e.target);
        if (!callback(inputPass1.value, inputPass2.value)) {
            afficherAide(e.target, messageErreur, "#cc0033", '<i class="fa fa-exclamation" aria-hidden="true"></i>');
        } else {
            afficherAide(e.target, messageSucces, "#0f4530", '<i class="fa fa-check" aria-hidden="true"></i>');
        }
    });
}

/**
 * fonction pour verifier si le formulaire d'inscription est valide
 */
function verifierInscritpion_aux(nomElt, prenomElt, mailElt, phoneElt, password_1Elt, password_2Elt) {
    return (verifierNomPrenom(nomElt.value) && verifierNomPrenom(prenomElt.value) && verifierMail(mailElt.value) && verifierPhone(phoneElt.value) && verifierSoliditePass(password_1Elt.value) && verifierCorrespondancePass_aux(password_1Elt.value, password_2Elt.value));
}

function verifierInscription(formElt, nomElt, prenomElt, mailElt, phoneElt, password_1Elt, password_2Elt, messageErreur) {
    formElt.addEventListener("submit", function (e) {
        effacerAide(formElt[formElt.length - 1]);
        if (!verifierInscritpion_aux(nomElt, prenomElt, mailElt, phoneElt, password_1Elt, password_2Elt)) {
            e.preventDefault();
            afficherAide(formElt[formElt.length - 1], messageErreur, "#cc0033", '<i class="fa fa-exclamation" aria-hidden="true"></i>');
        }
    });
}

/**
 * fonction pour verifier si le formulaire du message est valide
 */
function verifierMessage_aux(prenomElt, mailElt, messageElt) {
    return (verifierNomPrenom(prenomElt.value) && verifierMail(mailElt.value) && verifierContenuMessage(messageElt.value));
}

function verifierMessage(formElt, prenomElt, mailElt, messageElt, messageErreur) {
    formElt.addEventListener("submit", function (e) {
        effacerAide(formElt[formElt.length - 1]);
        if (!verifierMessage_aux(prenomElt, mailElt, messageElt)) {
            e.preventDefault();
            afficherAide(formElt[formElt.length - 1], messageErreur, "#cc0033", '<i class="fa fa-exclamation" aria-hidden="true"></i>');
        }
    });
}

/**
 * fonction pour vérifier si la quantité saisis  est valide
 */
function quantiteEstValide(quantite) {
    return (quantite >= 0 && quantite <= 50);
}

/**
 * fonction pour vérifier si le prix saisis est valide
 */
function prixEstValide(prix) {
    return (prix >= 0 && prix <= 50);
}

/**
 * fonction pour vérifier si la date saisis est valide
 */
function dateEstValide(date) {
    var dateSaisi = new Date(date);
    return ((dateSaisi - Date.now()) > 0)
}

/**
 * fonction pour vérifier si l'heure saisis est valide
 */
function heureEstValide(heure) {
    return (heure !== null);
}

/**
 * fonctions pour vérifier si les dates saisis sont cohérent 
 */
function datesSontCoherent(date1, date2) {
    return ((new Date(date2) - new Date(date1)) >= 0 && dateEstValide(date1) && dateEstValide(date2));
}

function verifierCoherenceDate(date1, date2, messageSucces, messageErreur, callback) {
    date2.addEventListener("input", function (e) {
        effacerAide(e.target);
        if (!callback(date1.value, date2.value)) {
            afficherAide(e.target, messageErreur, "#cc0033", '<i class="fa fa-exclamation" aria-hidden="true"></i>');
        } else {
            afficherAide(e.target, messageSucces, "#0f4530", '<i class="fa fa-check" aria-hidden="true"></i>');
        }
    });
}


/**
 * fonction pour verifier si les villes sont valide
 */
function villeEstValide(ville) {
    var retour = false;
    var paysList = jaxGetJson("http://bagshare.com/data/villes/villes.json");
    paysList.forEach(function (Pays) {
        for (var i = 0; i < Pays.villes.length; i++) {
            if (ville.split(",")[0].toLowerCase() === Pays.villes[i].toLowerCase()) {
                retour = true;
            }
        }
    });

    return retour;
}

/**
 * fonction pour  verifier si les villes saisis sont cohérentes
 */
function villesSontCoherent(ville1, ville2) {
    return ((ville1 !== ville2) && villeEstValide(ville1) && villeEstValide(ville2));
}


/**
 * fonction pour verifier si le formulaire pour ajouter une offre est valide
 */
function ajoutOffreFormEstValide(quantiteColis, quantiteLettre, prixColis, prixLettre, phoneOffre, villeDepart, dateArrive, heureDepart, villeArrive, dateArrive, heureArrive) {
    return (quantiteEstValide(quantiteColis) && quantiteEstValide(quantiteLettre) && prixEstValide(prixColis) && prixEstValide(prixLettre) && verifierPhone(phoneOffre) && villesSontCoherent(villeDpart, villeArrive) && datesSontCoherent(dateDepart, dateArrive) && heureEstValide(heureArrive) && heureEstValide(heureDepart));
}

function verifierAjoutOffreSubmit(formElt, quantiteColisElt, quantiteLettreElt, prixColisElt, prixLettreElt, phoneOffreElt, villeDepartElt, dateDepartElt, heureDepartElt, villeArriveElt, dateArriveElt, heureArriveElt, messageErreur) {
    console.log(formElt[formElt.length - 1]);
    formElt.addEventListener("submit", function (e) {
        if (!ajoutOffreFormEstValide(quantiteColisElt.value, quantiteLettreElt.value, prixColisElt.value, prixLettreElt.value, phoneOffreElt.value, villeDepartElt.value, dateDepartElt.value, heureDepartElt.value, villeArriveElt.value, dateArriveElt.value, heureArriveElt.value)) {
            e.preventDefault();
            effacerAide(formElt[formElt.length - 1]);
            afficherAide(formElt[formElt.length - 1], messageErreur, "#cc0033", '<i class="fa fa-exclamation" aria-hidden="true"></i>');
        }
    });
}

/**
 * fonction pour afficher aide lors d'un saisis d'une ville
 */
function afficherAideSaisis(inputElt) {
    var PaysList = jaxGetJson("http://bagshare.com/data/villes/villes.json");
    inputElt.addEventListener("input", function (e) {

        /* vider aide */
        e.target.nextElementSibling.textContent = " ";

        console.log(PaysList);
        for (var i = 0; i < PaysList.length; i++) {

            /* afficher aide */
            for (var j = 0; j < PaysList[i].villes.length; j++) {
                /* si saisie correspond nom ville alors afficher aide-saisie */

                if (PaysList[i].villes[j].toLowerCase().indexOf(e.target.value.toLowerCase()) === 0) {
                    var pElt = document.createElement("p");
                    pElt.textContent = PaysList[i].villes[j] + ", " + PaysList[i].nom;

                    /* ajout évènement click sur liste villes proposés */
                    pElt.addEventListener("click", function (f) {
                        e.target.value = f.target.textContent;

                        /* Effacer le contenu aide-saisie après choix */
                       e.target.nextElementSibling.textContent = " "; e.target.nextElementSibling.nextElementSibling.textContent = " ";
                        /* marquer input comme valide */
                        e.target.style.borderColor = "#0f4530";
                        e.target.style.boxShadow = "#0f4530 1px 1px 1px";
                    });
                    e.target.nextElementSibling.appendChild(pElt);
                }

            }

        };
    });

    inputElt.addEventListener("blur", function (e) {
        e.target.nextElementSibling.nextElementSibling.textContent = " ";
        
        /* si ville trouvé affiché message */
    if (! villeEstValide(e.target.value.split(",")[0])) {
        e.target.nextElementSibling.nextElementSibling.textContent = "Nom de ville invalide ";
        e.target.nextElementSibling.nextElementSibling.style.color = "#cc0033";
        e.target.nextElementSibling.nextElementSibling.style.fontSize = "1.0em";

        e.target.style.borderColor = "#cc0033";
        e.target.style.boxShadow = "#cc0033 1px 1px 1px";
    } else {
        e.target.style.borderColor = "#0f4530";
        e.target.style.boxShadow = "#0f4530 1px 1px 1px";

    }

    });
    
}