<?php

/* @var $this yii\web\View */
/* @var $model app\modules\post\models\Comment */

$this->title = 'Обновить комментарий: ' . $model->email;
$this->params['breadcrumbs'][] = ['label' => 'Comments', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->email, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Обновить';
?>
<?= $this->render('_form', [
    'model' => $model,
]) ?>


