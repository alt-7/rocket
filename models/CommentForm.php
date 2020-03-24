<?php
/**
 * Created by PhpStorm.
 * User: Altosh
 * Date: 24.03.2020
 * Time: 17:54
 */

namespace app\models;

use Yii;
use yii\base\Model;
use app\modules\post\models\Comment;

/**
 * ContactForm is the model behind the contact form.
 */
class CommentForm extends Model
{
    public $name;
    public $email;
    public $comment;
    public $post_id;
    public $verifyCode;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['name', 'email', 'comment', 'post_id'], 'required'],
            ['email', 'email'],
            ['verifyCode', 'captcha'],
        ];
    }

    /**
     * @return array customized attribute labels
     */
    public function attributeLabels()
    {
        return [
            'verifyCode' => 'Verification Code',
        ];
    }

    /**
     * @return bool
     */
    public function save()
    {
        if ($this->validate()) {
            $comment = new Comment([
                'name' => $this->name,
                'email' => $this->email,
                'comment' => $this->comment,
                'post_id' => $this->post_id
            ]);
            return $comment->save();
        }
        return false;
    }
}
