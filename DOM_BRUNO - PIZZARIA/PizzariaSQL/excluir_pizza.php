<?php
    include 'functions.php';

    if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])) {
        $pdo = pdo_connect_pgsql();

        // Excluir a pizza do banco de dados
        $stmt = $pdo->prepare('DELETE FROM pizzas WHERE id_pizza = :id');
        $stmt->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
        $stmt->execute();

        // Redirecionar de volta para a página de pesquisa de pizzas após a exclusão
        header('Location: pesquisar.php');
        exit();
    } else {
        // Se o método de requisição não for GET ou se o parâmetro "id" não estiver definido, redirecionar para a página principal ou exibir uma mensagem de erro
        header('Location: index.php');
        exit();
    }
?>
