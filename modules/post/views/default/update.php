<?php

/* @var $this yii\web\View */
/* @var $model app\modules\post\models\Post */

$this->title = 'Обновить пост: ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Обновить';
?>

<?= $this->render('_form', [
    'model' => $model,
]) ?>


