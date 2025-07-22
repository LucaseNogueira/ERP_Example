<?php

class View
{
    public static function render($viewPath, $data = [])
    {
        extract($data);

        ob_start();
        require __DIR__ . '/../src/view/' . $viewPath . '.php';
        $content = ob_get_clean();

        require __DIR__ . '/../src/view/layout.php';
    }
}
