var formElt = document.getElementById("gestion-auth");
var pass2 = formElt[1];
var btnElt = formElt[formElt.length - 1];
console.log(btnElt);
/* verifier password 2 */
verifierInput(pass2, "mot de passe valide", "le mot de passe doit contenir 8 caractères au minimum et composés d'au moins un caractère spécial(*!?()/#'&@$^:`) et d'au moins un chiffre et au moins une lettre en majuscule et en minuscule", verifierSoliditePass);
console.log(pass2);

formElt.addEventListener("submit", function (e){
    effacerAide(btnElt);
    if (!verifierSoliditePass(pass2.value)){
        e.preventDefault();
        afficherAide(btnElt, "Veillez compléter correctement le formulaire", "#cc0033", '<i class="fa fa-exclamation" aria-hidden="true"></i>');
    }
});