<?php

class IndexView
{
    public static function displayHeader($page_title)
    {
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $page_title ?></title>

    <script>
    //create the JavaScript variable for the base url
             var base_url = "<?= BASE_URL ?>";
    </script>
</head>
    
<body>
    <div id="top"></div>
         <div id='wrapper'>
              <div id="banner">

    <?php
    }
    public static function displayFooter()
    {
        ?>

</body>

</html>
<?php
    }
}
