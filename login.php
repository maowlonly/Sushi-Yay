<?php
require_once "config/database.php";
require_once "includes/functions.php";

$base =""; #tanpa spasi
$page_title = "Login"; #nama tittle web
$error =""; 

if($_SERVER['REQUEST_METHOD']==='POST'){
    $email = trim($_POST['email']);
    $password = $_POST['password']; #hayo kira-kira kenapa password ga pakai trim?

    $stmt = $conn->prepare("SELECT * FROM users WHERE email= :email");
    $stmt->execute(['email'=> $email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC); 
   

    if($user && password_verify($password,$user['password'])){
       

        $_SESSION['user_id'] = $user['id'];
        $_SESSION['nama'] = $user['nama'];
        $_SESSION['role'] = $user['role'];

        header("location : index.php"); #titik koma # if u right, u gonna go to index. if not u stay in login forever
        exit;
    }else{
        $error = "wrong email & password.";

    } #if else ini tidak terpisahkan, best friend forever :)

}
require "includes/header.php";


?>

<!-- kita buat sectionnya dulu yang gampang -->

<section class="auth-page"> <!--#nama kelas boleh beda ya -->
    <div class="auth-box">
        <h2> Login </h2>

        <?php if($error): ?>
            <p class="alert-error"><?= htmlspecialchars($error)?></p>
             <!--php bisa digunakan seperti ini ya  -->
        <?php endif;?> 
    
        <form method="POST" action="login.php"> <!-- kita sambungkan ke login.php kalau di klik-->
            <label> Email</label>
            <input type="email" name="email" required> <!--cek database untuk penamaan email-->

            <label>Password</label>
            <input type="password" name="password" required>

            <button type="submit" class="btn-login"> Login </button> 
        </form>
        <!-- we make a name link to user if an user does'nt have account -->

        <p>haven't account? <a href="register.php"> Register here</a></p>
    </div>
</section>

<!-- kita hubungkan ke css alias footer. karena css di dalam footer -->

<?php require "includes/footer.php"; ?>


<!-- back to php diatas yaa lets go scroll up -->