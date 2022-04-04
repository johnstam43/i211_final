<?php

class InventoryItem
{
    private $item_id, $title, $release_date, $category, $price, $language, $parental_advisory, $stock, $description;

    public function __construct($title, $release_date, $category, $price, $language, $parental_advisory, $stock, $description)
    {
        $this->title = $title;
        $this->release_date = $release_date;
        $this->category = $category;
        $this->price = $price;
        $this->language = $language;
        $this->parental_advisory = $parental_advisory;
        $this->stock = $stock;
        $this->description = $description;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getTitle()
    {
        return $this->title;
    }
    public function getReleaseDate()
    {
        return $this->release_date;
    }
    public function getCategory()
    {
        return $this->category;
    }
    public function getPrice()
    {
        return $this->price;
    }
    public function getLanguage()
    {
        return $this->language;
    }
    public function getParentalAdvisory()
    {
        return $this->parental_advisory;
    }
    public function getDescription()
    {
        return $this->description;
    }
}