<?php
use yii\helpers\Html;
use yii\widgets\LinkPager;

/* @var $this yii\web\View */
/* @var $posts */
/* @var $post \app\modules\post\models\Post */
/* @var $pages */

$this->title = 'My Yii Application';
?>
<div class="site-index">
  <div class="body-content">
    <div class="row">
        <?php
        foreach ($posts as $post): ?>
          <div class="col-lg-4">
            <h2><?= Html::encode($post->title); ?></h2>
            <p><?= substr($post->text, 0, 100); ?></p>
            <p><a class="btn btn-default"
                  href="<?= \yii\helpers\Url::to(['site/view', 'slug' => $post->slug]) ?>">
                Подробнее
              </a></p>
          </div>
        <?php endforeach; ?>
    </div>
      <?= LinkPager::widget([
          'pagination' => $pages,
      ]); ?>
  </div>
</div>
