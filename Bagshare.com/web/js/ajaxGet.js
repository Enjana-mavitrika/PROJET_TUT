function ajaxGet(url, callback){
    var req = new XMLHttpRequest();
    req.open("GET", url);
    req.addEventListener("load", function (){
        if (req.status >= 200 && req.status < 400){
            callback(req.responseText);
        } 
        else {
            console.error(req.status + " " + req.statusText + " " + url);
        }
    });
    req.addEventListener("error", function (){
        console.error("erreur réseau avec l'URL " + url);
    });
    req.send(null);
}

function jaxGetJson(url) {
    var reponse = null;
    var req = new XMLHttpRequest();
    req.open("GET", url, false);
    req.send(null);
    if (req.status >= 200 && req.status < 400) {
        reponse = JSON.parse(req.responseText);
    } else {
        console.error(req.status + " " + req.statusText + " " + url);
    }
    req.addEventListener("error", function () {
        console.error("erreur réseau avec l'URL " + url);
    });

    return reponse;
}