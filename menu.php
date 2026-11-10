<?php
require_once "config/database.php";
require_once "includes/functions.php";

$base = "";
$page_title = "Menu";

// Ambil kategori dari database
$categories = getCategories($conn);

// Ambil kategori yang dipilih dari URL
$selectedCategory = isset($_GET['kategori'])
    ? (int) $_GET['kategori']
    : null;

// Ambil menu berdasarkan kategori
$menuItems = getMenuItems($conn, $selectedCategory);

require "includes/header.php";
?>

<main class="menu-page">

    <!-- SIDEBAR KATEGORI -->
    <aside class="menu-sidebar">
        <h3>Categories</h3>

        <ul>
            <li>
                <a href="menu.php"
                   class="<?= !$selectedCategory ? 'active' : '' ?>">
                    All Menu
                </a>
            </li>

            <?php foreach ($categories as $cat): ?>
                <li>
                    <a href="menu.php?kategori=<?= (int)$cat['id'] ?>"
                       class="<?= $selectedCategory == $cat['id'] ? 'active' : '' ?>">
                        <?= htmlspecialchars($cat['nama_kategori']) ?>
                    </a>
                </li>
            <?php endforeach; ?>
        </ul>
    </aside>

    <!-- MENU CONTENT -->
    <section class="menu-content">

        <h2>
            <?php
            if ($selectedCategory) {
                $categoryName = "Menu";

                foreach ($categories as $cat) {
                    if ((int)$cat['id'] === $selectedCategory) {
                        $categoryName = $cat['nama_kategori'];
                        break;
                    }
                }

                echo htmlspecialchars($categoryName);
            } else {
                echo "All Menu";
            }
            ?>
        </h2>

        <div class="menu-grid">

            <?php if (empty($menuItems)): ?>

                <p>Belum ada menu di kategori ini.</p>

            <?php else: ?>

                <?php foreach ($menuItems as $item): ?>

                    <div class="menu-card">

                        <img
                            src="assets/img/<?= rawurlencode($item['gambar']) ?>"
                            alt="<?= htmlspecialchars($item['nama_menu']) ?>"
                            onerror="this.onerror=null; this.src='assets/img/edamame.jpg';"
                        >

                        <h4>
                            <?= htmlspecialchars($item['nama_menu']) ?>
                        </h4>

                        <p>
                            <?= htmlspecialchars($item['deskripsi']) ?>
                        </p>

                        <span class="harga">
                            <?= formatRupiah($item['harga']) ?>
                        </span>

                    </div>

                <?php endforeach; ?>

            <?php endif; ?>

        </div>
    </section>

</main>

<?php require "includes/footer.php"; ?>