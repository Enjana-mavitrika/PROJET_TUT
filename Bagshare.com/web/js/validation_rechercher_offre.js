var formElt = document.getElementById("rechercher-offre");


formElt.addEventListener("submit", function (e){
    effacerAide(formElt[formElt.length - 1]);
    if (!villeEstValide(formElt[0].value) || !villeEstValide(formElt[1].value) || formElt[0].value === formElt[1].value){
        e.preventDefault();
        afficherAide(formElt[formElt.length - 1], "Veillez remplir corrèctement le formulaire", "#cc0033", '<i class="fa fa-exclamation" aria-hidden="true"></i>');
    }
});