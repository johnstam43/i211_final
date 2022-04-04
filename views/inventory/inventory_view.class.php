<?php

class InventoryView
{
    public function display($inventory)
    {
        IndexView::displayHeader("Inventory");
?>
<h1>Hello this is the inventory</h1>
<?php
        foreach ($inventory as $item) {
            echo '<p>' . $item["title"] . '</p>';
        }
        ?>
<?php
        IndexView::displayFooter();
    }
}