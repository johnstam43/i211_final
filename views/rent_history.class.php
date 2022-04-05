<?php

class RentHistory
{
    public function display($rent_history)
    {
        IndexView::displayHeader("Rent History");
?>
<h1>Hello this is the Rent History</h1>
<?php
        foreach ($rent_history as $times) {
            echo '<p>' . $times["check_out"] . '</p>';
            echo '<p>' . $times["return_date"] . '</p>';
        }
        ?>
<?php
        IndexView::displayFooter();
    }
}
