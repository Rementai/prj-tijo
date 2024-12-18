<?php

namespace Tests\Feature;

use CodeIgniter\Test\FeatureTestTrait;
use CodeIgniter\Test\CIUnitTestCase;

class CategoryIntegrationTest extends CIUnitTestCase
{
    use FeatureTestTrait;

    public function testGetAllCategories()
    {
        // Arrange
        $db = \Config\Database::connect();
        $db->table('categories')->insertBatch([
            ['name' => 'Category 1', 'description' => 'Description 1', 'icon' => 'icon1.png'],
            ['name' => 'Category 2', 'description' => 'Description 2', 'icon' => 'icon2.png']
        ]);

        // Act
        $result = $this->get('/categories');

        // Assert
        $result->assertStatus(200);
        $result->assertJSONCount(2);
        
        $result->assertJSON([
            ['category_id' => '10', 'name' => 'Category 1', 'description' => 'Description 1', 'icon' => 'icon1.png'],
            ['category_id' => '11', 'name' => 'Category 2', 'description' => 'Description 2', 'icon' => 'icon2.png']
        ]);
    }

    public function testResponseContainsExpectedCategoryFields()
    {
        // Arrange
        $db = \Config\Database::connect();
        $db->table('categories')->insert([
            'name' => 'Category Test',
            'description' => 'Test description',
            'icon' => 'test-icon.png'
        ]);

        // Act
        $result = $this->get('/categories');

        // Assert
        $result->assertStatus(200);
        $result->assertJSONStructure([
            ['category_id', 'name', 'description', 'icon']
        ]);
    }
}
