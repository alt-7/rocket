<?php

namespace app\modules\post\models;

use Yii;

/**
 * This is the model class for table "posts".
 *
 * @property integer $id
 * @property string $title
 * @property string $text
 * @property string $slug
 * @property string $published_at
 * @property integer $is_active
 * @property string $created_at
 * @property string $updated_at
 *
 * @method mixed evaluateAttributes($event) Evaluates the attribute value and assigns it to the current attributes.
 */
class Post extends \yii\db\ActiveRecord
{
    const ACTIVE = 1;
    const IN_ACTIVE = 0;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'posts';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title'], 'required'],
            [['text'], 'string'],
            [['published_at', 'created_at', 'updated_at'], 'safe'],
            [['is_active'], 'integer'],
            [['title', 'slug'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Заголовок',
            'text' => 'Текст',
            'slug' => 'URL',
            'published_at' => 'Дата публикации',
            'is_active' => 'Активность',
            'created_at' => 'Дата создания',
            'updated_at' => 'Дата обновления',
        ];
    }

    /**
     * @inheritdoc
     * @return PostQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new PostQuery(get_called_class());
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'slug' => [
                'class' => 'Bridge\Slug\BridgeSlugBehavior',
                'slugAttribute' => 'slug',
                'attribute' => 'title',
                'ensureUnique' => 1,
                'replacement' => '-',
                'lowercase' => 1,
                'immutable' => 1,
                'transliterateOptions' => 'Russian-Latin/BGN; Any-Latin; Latin-ASCII; NFD; [:Nonspacing Mark:] Remove; NFC;',
            ],
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(Comment::className(), ['post_id' => 'id']);
    }
}
