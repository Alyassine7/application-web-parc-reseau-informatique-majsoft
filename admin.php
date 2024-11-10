

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Connexion</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  <link href="fontawesome-free-6.6.0-web/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .loginbox {
            max-width: 400px;
            width: 100%;
            padding: 2rem;
            border-radius: .5rem;
            background-color: #ffffff;
            box-shadow: 0 0 1rem rgba(0,0,0,.1);
        }
        .input-group-text {
            background-color: #e9ecef;
            border: 1px solid #ced4da;
        }
        .form-title {
            margin-bottom: 1.5rem;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <div class="container justify-content-center">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="loginbox text-center">
                    <h1 class="form-title">ADMIN CONNEXION</h1>
                    <form method="POST" action="">
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                <input type="email" class="form-control" id="mail" name="mail" placeholder="Entrez votre adresse email" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                <input type="password" class="form-control" id="mdp" name="mdp" placeholder="Entrez votre mot de passe" required>
                            </div>
                        </div>
                        <button type="submit" name="btconnexion" class="btn btn-primary w-100">CONNEXION</button>
                    </form>
                    <?php
                    if(isset($erreur))
                    {
                        echo '<font color="red">'.$erreur."</font>";
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
