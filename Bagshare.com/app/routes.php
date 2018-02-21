<?php

use Symfony\Component\HttpFoundation\Request;
use Bagshare\Domain\User;
use Bagshare\Form\Type\UserType;

// home page
$app->match('/', function (Request $request) use ($app){

    $authenticated = false;
    if ($app['security.authorization_checker']->isGranted('IS_AUTHENTICATED_FULLY')){
         $authenticated = true;
     }
    return $app['twig']->render("home.html.twig", array(
        "authenticated" => $authenticated,
        "link"=>"home",
        "errors"=>array()
    ));
})->bind('home');

    // register user
$app->match('/register', function (Request $request) use ($app){
    
    $errors = array();
    
    if (! empty($_POST)){
        
        $user = new User($_POST);
        
        // check passwords
        if ($_POST['password'] !== $_POST['password_2']){
            $errors[] = "Les mots de passe ne correspondent pas.";
        }
        
        // check user info
        if (empty($user->getUserName()) && empty($user->getUserPhone()) && empty($user->getUsermail()) && empty($user->getUserFirstName()) && empty($user->getPassword())){
            $errors[] = "Veillez remplir correctement le formulaire";
        }
        
        
        
        if (empty($errors)){
            
            // generate a random salt value
        $salt = substr(md5(time()), 0, 23);
        $user->setSalt($salt);
        $plainPassword = $user->getPassword();
        // get the default encoder
        $encoder = $app['security.encoder.bcrypt'];
        // compute the encode password
        $password = $encoder->encodePassword($plainPassword, $user->getSalt());
        $user->setPassword($password);
        $user->setRole('ROLE_USER');
        
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

// login user
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


// user messages
$app->match('/messages', function (Request $request) use ($app){
   return $app['twig']->render('messages.html.twig', array(
       "authenticated"=>true,
       "link"=>"messages"
   )); 
});

// user profil
$app->match('/profil', function (Request $request) use ($app){
   return $app['twig']->render('profil.html.twig', array(
    "authenticated"=>true,
       "link"=>"myAccount"
   )); 
});

// offer
$app->match('/offres', function (Request $request) use ($app){
    return $app['twig']->render('offres.html.twig', array(
        "authenticated"=>true,
        "link"=>"myAccount"
    ));
});