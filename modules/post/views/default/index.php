<?php

use dosamigos\grid\GridView;
use yii2tech\admin\grid\ActionColumn;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\post\models\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Посты';
$this->params['breadcrumbs'][] = $this->title;
$this->params['contextMenuItems'] = [
    ['create'],
];
?>

<?= GridView::widget([
    'dataProvider' => $dataProvider,
    'options' => ['class' => 'grid-view table-responsive'],
    'behaviors' => [
        \dosamigos\grid\behaviors\ResizableColumnsBehavior::class
    ],
    'filterModel' => $searchModel,
    'columns' => [
        ['class' => 'yii\grid\SerialColumn'],

        'id',
        'title',
        [
            'class' => 'Bridge\Core\Widgets\Columns\TruncatedTextColumn',
            'attribute' => 'text',
        ],
        'slug',
        'published_at',
        // [
            // 'class' => 'dosamigos\grid\columns\ToggleColumn',
            // 'attribute' => 'is_active',
            // 'onValue' => 1,
            // 'onLabel' => 'Active',
            // 'offLabel' => 'Not active',
            // 'contentOptions' => ['class' => 'text-center'],
            // 'afterToggle' => 'function(r, data){if(r){console.log("done", data)};}',
            // 'filter' => ['1' => 'Active', '0' => 'Not active'],
        // ],
        // 'created_at',
        // 'updated_at',

        [
            'class' => ActionColumn::class,
        ],
    ],
]); ?>
