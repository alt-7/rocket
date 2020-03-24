<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%comments}}`.
 */
class m200324_051722_create_comments_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%comments}}', [
            'id' => $this->primaryKey(),
            'name' => $this->string()->notNull()->comment('Имя'),
            'email' => $this->string()->notNull()->comment('E-mail'),
            'comment' => $this->text()->notNull()->comment('Комментарий'),
            'post_id' => $this->integer()->notNull()->comment('Пост ID'),
            'status' =>  $this->tinyInteger()->notNull()->defaultValue(1)->comment('Статус'),
            'created_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP()')->comment('Дата создания'),
            'updated_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP()')->comment('Дата обновления'),
        ]);

        $this->addForeignKey(
            'post_id',
            'comments',
            'post_id',
            'posts',
            'id',
            'CASCADE'
        );
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%comments}}');
        $this->dropForeignKey(
            'post_id',
            'posts'
        );
    }
}
