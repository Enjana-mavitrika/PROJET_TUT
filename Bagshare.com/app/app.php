<?php

use Symfony\Component\Debug\ErrorHandler;
use Symfony\Component\Debug\ExceptionHandler;

// register global error and exception handlers.
ErrorHandler::register();
ExceptionHandler::register();

// register services provider
$app->register(new Silex\Provider\DoctrineServiceProvider());
$app->register(new Silex\Provider\TwigServiceProvider(), array(
    "twig.path"=>__DIR__."/../views",
));
$app['twig'] = $app->extend('twig', function(Twig_Environment $twig, $app){
    $twig->addExtension(new Twig_Extensions_Extension_Text());
    
    return $twig;
});
$app->register(new Silex\Provider\ValidatorServiceProvider());
$app->register(new Silex\Provider\AssetServiceProvider(), array(
    "asset.version"=>"v1",
));
$app->register(new Silex\Provider\SessionServiceProvider());
$app->register(new Silex\Provider\SecurityServiceProvider(), array(
    'security.firewalls' => array(
        'secured' => array(
            'pattern' => '^/',
            'anonymous' => true,
            'logout' => true,
            'form' => array('login_path' => '/login', 'check_path' => '/login_check'),
            'users' => function () use ($app){
                return new Bagshare\DAO\UserDAO($app['db']);
            },
        ),
    ),
   'security.role_hierarchy' => array(
       'ROLE_ADMIN' => array('ROLE_USER'),
   ),
    'security.access_rules' => array(
        array('^/admin', 'ROLE_ADMIN'),
    ),
));
$app->register(new Silex\Provider\FormServiceProvider());
$app->register(new Silex\Provider\LocaleServiceProvider());
$app->register(new Silex\Provider\TranslationServiceProvider());



// register services

$app['dao.user'] = function ($app){
    return new Bagshare\DAO\UserDAO($app['db']);
};
