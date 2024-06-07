<?php
include 'functions.php';

$pdo = pdo_connect_pgsql();

// Verificar se o ID da promoção foi passado via GET
if(isset($_GET['id'])) {
    // Capturar o ID da promoção
    $id_promocao = $_GET['id'];

    // Excluir a promoção do banco de dados
    $stmt = $pdo->prepare('DELETE FROM promocoes WHERE id_promocao = :id_promocao');
    $stmt->bindValue(':id_promocao', $id_promocao, PDO::PARAM_INT);
    $stmt->execute();

    // Verificar se a exclusão foi bem-sucedida
    if($stmt->rowCount() > 0) {
        // Se a promoção foi excluída com sucesso, redirecionar para a página de promoções
        header('Location: promocoes.php');
        exit();
    } else {
        // Se a promoção não foi encontrada, redirecionar para a página de promoções com mensagem de erro
        header('Location: promocoes.php?error=Promo%C3%A7%C3%A3o%20n%C3%A3o%20encontrada');
        exit();
    }
} else {
    // Se o ID da promoção não foi passado, redirecionar para a página de promoções com mensagem de erro
    header('Location: promocoes.php?error=ID%20da%20promo%C3%A7%C3%A3o%20n%C3%A3o%20fornecido');
    exit();
}
?>



<?=template_header('Apagar Promoção')?>

<div class="content delete">
	<h2>Apagar Pedido ----  <?=$contact['nome_promocao']?></h2>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php else: ?>
	<p>Você tem certeza que deseja apagar a promocao ----<?=$contact['nome_promocao']?>?</p>
    <div class="yesno">
        <a href="apagar_promocao.php?id=<?=$contact['id_promocao']?>&confirm=yes">Sim</a>
        <a href="apagar_promocao.php?id=<?=$contact['id_promocao']?>&confirm=no">Não</a>
    </div>
    <?php endif; ?>
</div>

<?=template_footer()?>