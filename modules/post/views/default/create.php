<?php

/* @var $this yii\web\View */
/* @var $model app\modules\post\models\Post */

$this->title = 'Создать пост';
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<?= $this->render('_form', [
    'model' => $model,
]) ?>

