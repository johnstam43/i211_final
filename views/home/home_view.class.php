<?php

class HomeView
{
    public function display()
    {
        IndexView::displayHeader("Home");
?>
<h1>Hello</h1>
<?php
        IndexView::displayFooter();
    }
}