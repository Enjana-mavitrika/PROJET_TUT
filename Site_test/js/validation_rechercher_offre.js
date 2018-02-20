var formElt4 = document.getElementById("rechercherOffre");

console.log(formElt);

formElt4.addEventListener("submit", function (e){
    effacerAide(formElt4[formElt4.length - 1]);
    if (!villeEstValide(formElt4[0].value) || !villeEstValide(formElt4[1].value) || formElt4[0].value === formElt4[1].value){
        e.preventDefault();
        afficherAide(formElt4[formElt4.length - 1], "Veillez remplir corrèctement le formulaire", "#cc0033", '<i class="fa fa-exclamation" aria-hidden="true"></i>');
    }
});