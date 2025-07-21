<?php

class Router
{

    public function request()
    {
        $uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        $segments = array_filter(explode('/', trim($uri, '/')));

        $controller = ucfirst($segments[0] ?? 'produto') . 'Controller';
        $method = $segments[1] ?? 'index';

        $controllerPath = dirname(__DIR__) . '/src/controller/' . $controller . '.php';

        if (file_exists($controllerPath)) {
            require_once $controllerPath;

            if (class_exists($controller)) {
                $controllerInstance = new $controller();

                if (method_exists($controllerInstance, $method)) {
                    return $controllerInstance->$method();
                } else {
                    http_response_code(404);
                    echo "Método '$method' não encontrado.";
                }
            } else {
                http_response_code(404);
                echo "Classe '$controller' não encontrada.";
            }
        } else {
            http_response_code(404);
            echo "Controller '$controllerPath' não existe.";
        }
    }
}
