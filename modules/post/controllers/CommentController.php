<?php

namespace app\modules\post\controllers;

use Bridge\Core\Controllers\BaseAdminController;
use yii\helpers\ArrayHelper;
use yii2tech\admin\actions\Position;
use dosamigos\grid\actions\ToggleAction;

/**
 * CommentController implements the CRUD actions for [[app\modules\post\models\Comment]] model.
 * @see app\modules\post\models\Comment
 */
class CommentController extends BaseAdminController
{
    /**
     * @inheritdoc
     */
    public $modelClass = 'app\modules\post\models\Comment';
    /**
     * @inheritdoc
     */
    public $searchModelClass = 'app\modules\post\models\CommentSearch';




    /**
     * @inheritdoc
     */
    public function actions()
    {
        return ArrayHelper::merge(
            parent::actions(),
            [
                'toggle' => [
                    'class' => ToggleAction::class,
                    'modelClass' => 'app\modules\post\models\Comment',
                    'onValue' => 1,
                    'offValue' => 0
                ],
                'position' => [
                    'class' => Position::class,
                ],
            ]
        );
    }
}
