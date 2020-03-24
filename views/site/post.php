<?php
/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $comment \app\modules\post\models\Comment */
/* @var $this yii\web\View */

/* @var $post \app\modules\post\models\Post */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Посты';
$this->params['breadcrumbs'][] = $this->title;
?>
  <div class="body-content">
    <div class="row">
      <div class="col-lg-12">
        <h2><?= Html::encode($post->title); ?></h2>
        <p><?= $post->text; ?></p>
      </div>
    </div>
    <div class="col-md-12 text-right">
      <script type="text/javascript" src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"
              charset="utf-8"></script>
      <script type="text/javascript" src="//yastatic.net/share2/share.js" charset="utf-8"></script>
      <div class="ya-share2" data-counter data-limit="4"
           data-services="whatsapp,telegram,facebook,vkontakte"></div>
    </div>
    <div class="row">
      <h3>Оставить комментарий</h3><hr>
      <?php if (Yii::$app->session->hasFlash('CommentForm')): ?>
        <div class="alert alert-success">Cпасибо за комментарий</div>
      <?php endif; ?>
      <div class="row">
        <div class="col-lg-5">
            <?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>
            <?php if (Yii::$app->user->isGuest): ?>
                <?= $form->field($comment, 'name')->textInput(['autofocus' => true])->label('Ваше Имя') ?>
                <?= $form->field($comment, 'email') ?>
            <?php else: ?>
                <?= $form->field($comment, 'name')->hiddenInput(['value' => Yii::$app->user->identity->username])->label(false) ?>
                <?= $form->field($comment, 'email')->hiddenInput(['value' => Yii::$app->user->identity->email])->label(false) ?>
            <?php endif; ?>
            <?= $form->field($comment, 'comment')->textarea(['rows' => 6]) ?>
            <?= $form->field($comment, 'post_id')->hiddenInput(['value' => $post->id])->label(false) ?>
            <?= $form->field($comment, 'verifyCode')->widget(Captcha::class, [
                'template' => '<div class="row"><div class="col-lg-3">{image}</div><div class="col-lg-6">{input}</div></div>',
            ])->label(false) ?>
          <div class="form-group">
              <?= Html::submitButton('Отправить', ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
          </div>
            <?php ActiveForm::end(); ?>
        </div>
      </div>
    </div>
    <hr>
    <div class="row">
      <?php if(!empty($comments)):
        foreach ($comments as $comment): ?>
        <div class="col-lg-12">
          <h3><?= $comment->name ?></h3>
          <p style="color: #9e9e9e;"><?= Yii::$app->formatter->asRelativeTime(strtotime($comment->created_at), 'now'); ?></p>
          <p style="color: #000; font-size:16px; line-height:;"><?= $comment->comment; ?></p>
          <hr>
        </div>
      <?php endforeach;
      endif; ?>
    </div>
  </div>
<?php
