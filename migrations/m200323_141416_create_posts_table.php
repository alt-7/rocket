<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%posts}}`.
 */
class m200323_141416_create_posts_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%posts}}', [
            'id' => $this->primaryKey(),
            'title' => $this->string()->notNull()->comment('Заголовок'),
            'text' => $this->text()->comment('Текст'),
            'slug' => $this->string()->comment('URL'),
            'published_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP()')->comment('Дата публикации'),
            'is_active' => $this->tinyInteger()->notNull()->defaultValue(0)->comment('Активность'),
            'created_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP()')->comment('Дата создания'),
            'updated_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP()')->comment('Дата обновления'),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%posts}}');
    }
}
