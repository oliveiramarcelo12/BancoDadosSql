<?php
    include 'functions.php';

    if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])) {
        $pdo = pdo_connect_pgsql();

        // Verificar se a pizza existe no banco de dados
        $stmt = $pdo->prepare('SELECT * FROM pizzas WHERE id_pizza = :id');
        $stmt->bindValue(':id', $_GET['id'], PDO::PARAM_INT);
        $stmt->execute();
        $pizza = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$pizza) {
            // Se a pizza não existir, redirecionar para a página principal ou exibir uma mensagem de erro
            header('Location: index.php');
            exit();
        }
    } elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Lógica para atualizar a pizza no banco de dados após enviar o formulário de edição
    } else {
        // Se o método de requisição não for GET nem POST, redirecionar para a página principal ou exibir uma mensagem de erro
        header('Location: index.php');
        exit();
    }
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Pizzas</title>
    <!-- Adicione aqui os estilos CSS necessários -->
</head>
<body>

<h2>Editar Pizzas</h2>

<?php if (isset($error)): ?>
    <p class="error"><?=htmlspecialchars($error, ENT_QUOTES)?></p>
<?php elseif (isset($pizza)): ?>
    <form action="processar_edicao_pizza.php" method="post">
        <input type="hidden" name="id_pizza" value="<?=$pizza['id_pizza']?>">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="<?=$pizza['nome']?>" required><br>
        <label for="preco">Preço:</label>
        <input type="number" id="preco" name="preco" value="<?=$pizza['preco']?>" required><br>
        <label for="ingredientes">Ingredientes:</label>
        <textarea id="ingredientes" name="ingredientes" required><?=$pizza['ingredientes']?></textarea><br>
        <button type="submit">Salvar Alterações</button>
    </form>
<?php endif; ?>

</body>
</html>
</body>
</html>
