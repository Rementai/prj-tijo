<?php

namespace Tests\Feature;

use CodeIgniter\Test\FeatureTestTrait;
use CodeIgniter\Test\CIUnitTestCase;

class UserIntegrationTest extends CIUnitTestCase
{
    use FeatureTestTrait;

    public function testRegisterUserInvalidPassword()
    {
        // Arrange
        $data = [
            'username' => 'testuser2',
            'first_name' => 'John',
            'last_name' => 'Doe',
            'email' => 'testuser2@example.com',
            'password' => 'weakpass',
        ];

        // Act
        $result = $this->post('register', $data);

        // Assert
        $result->assertStatus(422);
        $result->assertJSONFragment(['error' => 'Password must be at least 8 characters long, contain one uppercase letter, one digit, and one special character.']);
    }

    public function testLoginInvalidCredentials()
    {
        // Arrange
        $data = [
            'email' => 'wronguser@example.com',
            'password' => 'WrongP@ssw0rd'
        ];

        // Act
        $result = $this->post('login', $data);

        // Assert
        $result->assertStatus(401);
        $result->assertJSON(['error' => 'Invalid email or password']);
    }

    public function testGetUserInfoInvalidToken()
    {
        // Arrange
        $token = 'invalid.token.string';
        $headers = ['Authorization' => 'Bearer ' . $token];

        // Act
        $result = $this->withHeaders($headers)->get('/user/info');

        // Assert
        $result->assertStatus(401);
        $result->assertJSON(['error' => 'Invalid token']);
    }

    public function testLoginWithValidCredentials()
    {
        // Arrange
        $data = [
            'email' => 'halo@halo.com',
            'password' => 'Halo-123',
        ];

        // Act
        $result = $this->post('/login', $data);

        // Assert
        $result->assertStatus(200);
        $result->assertJSONFragment(['message' => 'Login successful']);
    }

    public function testLoginWithMissingEmail()
    {
        // Arrange
        $data = [
            'password' => 'Min1malP@ss',
        ];

        // Act
        $result = $this->post('/login', $data);

        // Assert
        $result->assertStatus(401);
        $result->assertJSONFragment(['error' => 'Invalid email or password']);
    }
}
