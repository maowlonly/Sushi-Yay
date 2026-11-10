<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($page_title ?? 'Sushi Website') ?></title>
    <link rel="stylesheet" href="<?= $base ?>assets/style.css">
</head>

<body>

<header class="navbar">
    <div class="navbar-inner">

        <a href="<?= $base ?>index.php" class="logo">
            Sushi 🍣
        </a>

        <nav class="nav-links">
            <a href="<?= $base ?>index.php">Home</a>
            <a href="<?= $base ?>menu.php">Menu</a>
            <a href="<?= $base ?>login.php">Login</a>
        </nav>

    </div>
</header>