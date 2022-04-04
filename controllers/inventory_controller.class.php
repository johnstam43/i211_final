<?php
class InventoryController
{
    private $inventory_model;

    public function __construct()
    {
        $this->inventory_model = InventoryModel::getInventoryModel();
    }
    public function index()
    {
        $view = new InventoryView();
        $view->display();
    }
}
