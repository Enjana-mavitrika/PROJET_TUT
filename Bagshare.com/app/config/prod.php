<?php

// production version configuration
$app['db.options'] = array(
    "driver" => "pdo_mysql",
    "port" => "3306",
    "charset" => "utf8",
    "host" => "localhost",
    "dbname" => "bagshare",
    "user" => "nerd",
    "password" => "nerd",
);