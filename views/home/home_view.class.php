<?php

class HomeView
{
    public function display()
    {
        IndexView::displayHeader("Home");
?>
<h1>Welcome to Indiana Disc Rentals</h1>
<?php
        IndexView::displayFooter();
    }
}
