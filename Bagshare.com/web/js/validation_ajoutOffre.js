var formElt = document.getElementById("ajout-offre");
var quantiteColisElt = document.getElementById("quantite-colis");
var quantiteLettreElt = document.getElementById("quantite-lettre");
var prixColisElt = document.getElementById("prix-colis");
var prixLettreElt = document.getElementById("prix-lettre");
var phoneOffreElt = document.getElementById("phone-offre");
var villeDepartElt = document.getElementById("ville-depart");
var villeArriveElt = document.getElementById("ville-arrive");
var dateDepartElt = document.getElementById("date-depart");
var dateArriveElt = document.getElementById("date-arrive");
var heureDepartElt = document.getElementById("heure-depart");
var heureArriveElt = document.getElementById("heure-arrive");

/* verifier les quantité */
verifierInput(quantiteColisElt, "quantité valide", "quantité invalide", quantiteEstValide);
verifierInput(quantiteLettreElt, "quantité valide", "quantité invalide", quantiteEstValide);

/* verifier les prix */
verifierInput (prixColisElt, "prix valide", "prix invalide", prixEstValide);
verifierInput (prixLettreElt, "prix valide", "prix invalide", prixEstValide);

/* verifier le numéro de télephones */
verifierInput (phoneOffreElt, "numéro de téléphone valide", "numéro de téléphone invalide", verifierPhone);

/* verifier les dates */
verifierInput (dateDepartElt, "date valide", "date invalide", dateEstValide);
verifierInput (dateArriveElt, "date valide", "date invalide", dateEstValide);

/* verifier cohérence des dates */
verifierCoherenceDate(dateDepartElt, dateArriveElt, "date valide", "date non cohérent", datesSontCoherent);

/* verifier le formulaire avant soumissions */
verifierAjoutOffreSubmit(formElt, quantiteColisElt, quantiteLettreElt, prixColisElt, prixLettreElt, phoneOffreElt, villeDepartElt, dateDepartElt, heureDepartElt, villeArriveElt, dateArriveElt, heureArriveElt, "Veillez compléter correctement le formulaire");




