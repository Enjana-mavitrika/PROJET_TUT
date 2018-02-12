<?php

use Symfony\Component\HttpFoundation\Request;
use Bagshare\Domain\User;
use Bagshare\Form\Type\UserType;



/*-----------------------------------*
 *                                   *
 *         FUNCTIONS                 *
 *                                   *
 *-----------------------------------*/



/*-----------------------------------*
 *                                   *
 *         HOME PAGE                 *
 *                                   *
 *-----------------------------------*/

$app->match('/', function (Request $request) use ($app){

    $authenticated = $app['security.authorization_checker']->isGranted('IS_AUTHENTICATED_FULLY');
    
    return $app['twig']->render("home.html.twig", array(
        "authenticated" => $authenticated,
        "link"=>"home",
        "errors"=>array()
    ));
})->bind('home');



/*-----------------------------------*
 *                                   *
 *         OFFER PAGE                *
 *                                   *
 *-----------------------------------*/

$app->match('/offres', function (Request $request) use ($app){
    $authenticated = $app['security.authorization_checker']->isGranted('IS_AUTHENTICATED_FULLY');
    return $app['twig']->render('offres.html.twig', array(
        "authenticated"=>$authenticated,
        "link"=>"myAccount"
    ));
});



/*-----------------------------------*
 *                                   *
 *         ADD OFFER PAGE            *
 *                                   *
 *-----------------------------------*/

$app->match('/add_offer', function (Request $request) use ($app){
    $authenticated = $app['security.authorization_checker']->isGranted('IS_AUTHENTICATED_FULLY');
    return $app['twig']->render('ajout_offre.html.twig', array(
        "authenticated"=>$authenticated,
        "link"=>"none"
    )); 
});




/*-----------------------------------*
 *                                   *
 *       DETAIL OFFER PAGE           *
 *                                   *
 *-----------------------------------*/





/*-----------------------------------*
 *                                   *
 *         REGISTER PAGE             *
 *                                   *
 *-----------------------------------*/

$app->match('/register', function (Request $request) use ($app){
    
    $errors = array();
    
    if (! empty($_POST)){
        
        $user = new User($_POST);
        
        $errors = $user->signIn($_POST, 'password_2', 'ROLE_USER');
        
        
        if (empty($errors)){
        // save user into the database
        $app['dao.user']->save($user);
        // add a success flash message
        $app['session']->getFlashBag()->add('success', 'Vous êtes bien inscrit, bienvenue chez Bagshare ! ');
        }
        
        
        
    }
    
    return $app['twig']->render('login.html.twig', array(
        'errors' => $errors,
        'authenticated' => false,
        'link' => "register"
    ));
});



/*-----------------------------------*
 *                                   *
 *         LOGIN PAGE                *
 *                                   *
 *-----------------------------------*/

$app->match('/login', function (Request $request) use ($app){
    $errors = array();
    
    if (!empty($app['security.last_error']($request))){
        $errors[]= "Erreur de connection";
    }
    $authenticated = false;
     
    
    return $app['twig']->render('login.html.twig', array(
        "authenticated"=>$authenticated,
        "link"=>"login",
        "errors"=>$errors
    ));
});



/*-----------------------------------*
 *                                   *
 *         USER MESSAGES             *
 *                                   *
 *-----------------------------------*/

$app->match('/messages', function (Request $request) use ($app){
   return $app['twig']->render('messages.html.twig', array(
       "authenticated"=>true,
       "link"=>"messages"
   )); 
});



/*-----------------------------------*
 *                                   *
 *         USER PROFIL               *
 *                                   *
 *-----------------------------------*/

$app->match('/profil', function (Request $request) use ($app){
   return $app['twig']->render('profil.html.twig', array(
    "authenticated"=>true,
       "link"=>"myAccount"
   )); 
});
