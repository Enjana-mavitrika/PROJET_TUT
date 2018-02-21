<?php

require_once __DIR__."/../vendor/autoload.php";

$app = new Silex\Application();

// enable debug mode
$app['debug'] = true;

require_once __DIR__."/../app/config/dev.php";
require_once __DIR__."/../app/app.php";
require_once __DIR__."/../app/routes.php";

$app->run();