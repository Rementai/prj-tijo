<?php

namespace Tests\Unit;

use CodeIgniter\Test\CIUnitTestCase;
use App\Models\UserModel;

class UserModelTest extends CIUnitTestCase
{
    public function testUsernameValidationFailsIfNotUnique()
    {
        // Arrange
        $userModel = new UserModel();
        $userModel->insert([
            'username' => 'testuser',
            'email' => 'testuser@example.com',
            'password' => password_hash('Password123!', PASSWORD_BCRYPT),
            'first_name' => 'John',
            'last_name' => 'Doe',
        ]);

        $data = [
            'username' => 'testuser',
            'email' => 'newuser@example.com',
            'password' => password_hash('Password123!', PASSWORD_BCRYPT),
            'first_name' => 'Jane',
            'last_name' => 'Smith',
        ];

        // Act
        $isValid = $userModel->validate($data);

        // Assert
        $this->assertFalse($isValid);
        $this->assertArrayHasKey('username', $userModel->errors());
    }

    public function testEmailValidationFailsIfInvalid()
    {
        // Arrange
        $userModel = new UserModel();

        $data = [
            'username' => 'testuser2',
            'email' => 'invalid-email',
            'password' => password_hash('Password123!', PASSWORD_BCRYPT),
            'first_name' => 'John',
            'last_name' => 'Doe',
        ];

        // Act
        $isValid = $userModel->validate($data);

        // Assert
        $this->assertFalse($isValid);
        $this->assertArrayHasKey('email', $userModel->errors());
    }

    public function testPasswordValidationFailsIfTooShort()
    {
        // Arrange
        $userModel = new UserModel();

        $data = [
            'username' => 'testuser3',
            'email' => 'user3@example.com',
            'password' => 'short',
            'first_name' => 'Jane',
            'last_name' => 'Smith',
        ];

        // Act
        $isValid = $userModel->validate($data);

        // Assert
        $this->assertFalse($isValid);
        $this->assertArrayHasKey('password', $userModel->errors());
    }

    public function testHashPasswordGeneratesValidHash()
    {
        // Arrange
        $userModel = new UserModel();
        $password = 'Password123!';

        // Act
        $hashedPassword = $userModel->hashPassword($password);

        // Assert
        $this->assertTrue(password_verify($password, $hashedPassword));
    }

    public function testRequiredFieldsValidationFails()
    {
        // Arrange
        $userModel = new UserModel();

        $data = [
            'username' => '',
            'email' => '',
            'password' => '',
            'first_name' => '',
            'last_name' => '',
        ];

        // Act
        $isValid = $userModel->validate($data);

        // Assert
        $this->assertFalse($isValid);
        $this->assertArrayHasKey('username', $userModel->errors());
        $this->assertArrayHasKey('email', $userModel->errors());
        $this->assertArrayHasKey('password', $userModel->errors());
        $this->assertArrayHasKey('first_name', $userModel->errors());
        $this->assertArrayHasKey('last_name', $userModel->errors());
    }
}