<?php

namespace Tests\Unit;

use CodeIgniter\Test\CIUnitTestCase;
use App\Models\RecipeModel;

class RecipeTest extends CIUnitTestCase
{
    protected $recipeModel;

    protected function setUp(): void
    {
        parent::setUp();
        $this->recipeModel = new RecipeModel();
    }

    public function testValidRecipe()
    {
        // Arrange
        $data = [
            'title' => 'Delicious Soup',
            'description' => 'A wonderful soup for cold days.',
            'instructions' => 'Chop ingredients, boil water, mix everything.',
            'prep_time' => 15,
            'cook_time' => 30,
            'difficulty' => 'easy',
            'image' => 'https://example.com/soup.jpg',
        ];

        // Act
        $isValid = $this->recipeModel->validate($data);

        // Assert
        $this->assertTrue($isValid);
    }

    public function testGetRecipeWithIngredients()
    {
        // Arrange
        $recipeId = 1;

        // Act
        $recipeWithIngredients = $this->recipeModel->getRecipeWithIngredients($recipeId);

        // Assert
        $this->assertNotEmpty($recipeWithIngredients);
        $this->assertArrayHasKey('ingredient_name', $recipeWithIngredients[0]);
        $this->assertArrayHasKey('quantity', $recipeWithIngredients[0]);
    }

    public function testGetTopRatedRecipes()
    {
        // Arrange
        $limit = 3;

        // Act
        $topRecipes = $this->recipeModel->getTopRatedRecipes($limit);

        // Assert
        $this->assertCount($limit, $topRecipes);
        $this->assertGreaterThanOrEqual($topRecipes[0]['average_rating'], $topRecipes[1]['average_rating']);
    }

    public function testGetLatestRecipes()
    {
        // Arrange
        $limit = 5;

        // Act
        $latestRecipes = $this->recipeModel->getLatestRecipes($limit);

        // Assert
        $this->assertCount($limit, $latestRecipes);
        $this->assertGreaterThanOrEqual(
            strtotime($latestRecipes[1]['created_at']),
            strtotime($latestRecipes[0]['created_at'])
        );
    }


    public function testGetRecipesByDifficulty()
    {
        // Arrange
        $difficulty = 'easy';
        $expectedCount = 2;

        // Act
        $recipes = $this->recipeModel->getRecipesByDifficulty($difficulty);

        // Assert
        $this->assertNotEmpty($recipes);
        $this->assertCount($expectedCount, $recipes);
        foreach ($recipes as $recipe) {
            $this->assertEquals($difficulty, $recipe['difficulty']);
        }
    }

}
