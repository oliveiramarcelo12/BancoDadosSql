<?php
include 'functions.php';

$pdo = pdo_connect_pgsql();

if (isset($_GET['id'])) {
    $id_promocao = $_GET['id'];

    $stmt = $pdo->prepare('SELECT * FROM promocoes WHERE id_promocao = :id_promocao');
    $stmt->execute([':id_promocao' => $id_promocao]);
    $promocao = $stmt->fetch(PDO::FETCH_ASSOC);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_promocao = $_POST['id_promocao'];
    $nome_promocao = $_POST['nome_promocao'];
    $descricao = $_POST['descricao'];
    $desconto = $_POST['desconto'];
    $pizza = $_POST['pizza'];

    $sql = "UPDATE promocoes SET nome_promocao = :nome_promocao, descricao = :descricao, desconto = :desconto, pizza = :pizza WHERE id_promocao = :id_promocao";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':nome_promocao' => $nome_promocao,
        ':descricao' => $descricao,
        ':desconto' => $desconto,
        ':pizza' => $pizza,
        ':id_promocao' => $id_promocao
    ]);

    header('Location: promocoes.php');
    exit();
}

template_header('Editar Promoção');
?>

<h2>Editar Promoção</h2>
<form action="editar_promocao.php" method="POST">
    <label for="nome_promocao">Nome da Promoção:</label>
    <input type="text" name="nome_promocao" value="<?= htmlspecialchars($promocao['nome_promocao']) ?>" required>
    <label for="descricao">Descrição:</label>
    <textarea name="descricao" required><?= htmlspecialchars($promocao['descricao']) ?></textarea>
    <label for="desconto">Desconto (%):</label>
    <input type="number" name="desconto" value="<?= htmlspecialchars($promocao['desconto']) ?>" required>
    <label for="pizza">Sabor da Pizza:</label>
    <select name="pizza" required>
        <?php
            $stmt = pdo_connect_pgsql()->query('SELECT DISTINCT nome FROM pizzas');
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $selected = $promocao['pizza'] === $row['nome'] ? 'selected' : '';
                echo '<option value="' . htmlspecialchars($row['nome'], ENT_QUOTES) . '" ' . $selected . '>' . htmlspecialchars($row['nome'], ENT_QUOTES) . '</option>';
            }
        ?>
    </select>
    <input type="hidden" name="id_promocao" value="<?= $promocao['id_promocao'] ?>">
    <button type="submit">Atualizar Promoção</button>
</form>

<?=template_footer()?>
