<?php
defined('C5_EXECUTE') or die("Access Denied.");
$this->inc('elements/header.php'); ?>

  <div id="body"> 
    <?php
    $a = new Area('Main');
    $a->display($c);
    
    ?>
  </div>

<?php $this->inc('elements/footer.php'); ?>