<?php

namespace Tests\Feature;

use CodeIgniter\Test\FeatureTestTrait;
use CodeIgniter\Test\CIUnitTestCase;

class RecipeIntegrationTest extends CIUnitTestCase
{
    use FeatureTestTrait;

    public function testGetAllRecipes()
    {
        // Arrange
        $this->seedDatabaseWithRecipes(5);

        // Act
        $result = $this->get('/recipes/all');

        // Assert
        $result->assertStatus(200);
        $result->assertJSONCount(5);
    }

    public function testGetRecipeDetails()
    {
        // Arrange
        $recipeId = $this->seedRecipeWithIngredients();

        // Act
        $result = $this->get("/recipes/{$recipeId}");

        // Assert
        $result->assertStatus(200);
        $result->assertJSONFragment(['title' => 'Test Recipe']);
        $result->assertJSONStructure(['ingredients' => [['name', 'quantity', 'unit']]]);
    }

    public function testGetRecipesWithPagination()
    {
        // Arrange
        $this->seedDatabaseWithRecipes(15);

        // Act
        $result = $this->get('/recipes/all?page=2');

        // Assert
        $result->assertStatus(200);
        $result->assertJSONCount(5);
    }

    /*
    * Helpers for tests
    */
    private function seedDatabaseWithRecipes(int $count)
    {
        $recipeModel = new \App\Models\RecipeModel();

        for ($i = 1; $i <= $count; $i++) {
            $recipeModel->save([
                'title' => "Recipe {$i}",
                'description' => "Description for Recipe {$i}",
                'instructions' => "Instructions for Recipe {$i}",
                'prep_time' => 10,
                'cook_time' => 20,
                'difficulty' => 'medium',
                'user_id' => 1
            ]);
        }
    }

    private function seedRecipeWithIngredients()
    {
        $recipeModel = new \App\Models\RecipeModel();
        $recipeId = $recipeModel->insert([
            'title' => 'Test Recipe',
            'description' => 'Test Description',
            'instructions' => 'Test Instructions',
            'prep_time' => 10,
            'cook_time' => 20,
            'difficulty' => 'easy',
            'user_id' => 1
        ], true);

        $db = \Config\Database::connect();
        $db->table('recipe_ingredients')->insertBatch([
            ['recipe_id' => $recipeId, 'ingredient_id' => 1, 'quantity' => 2],
            ['recipe_id' => $recipeId, 'ingredient_id' => 2, 'quantity' => 1]
        ]);

        return $recipeId;
    }
}
