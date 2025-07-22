<?php

require_once __DIR__ . '/../../core/View.php';

class ProdutoController
{

    public function index()
    {
        View::render('produto/index', [
            'title' => 'Produtos'
        ]);
    }
}
