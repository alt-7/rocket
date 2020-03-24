<?php

/* @var $this yii\web\View */
/* @var $model app\modules\post\models\Comment */

$this->title = 'Создать комментарий';
$this->params['breadcrumbs'][] = ['label' => 'Comments', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<?= $this->render('_form', [
    'model' => $model,
]) ?>

