
# Testowanie i jakość oprogramowania II

#### Testowanie serwisu z przepisami kulinarnymi



Strona z przepisami kulinarnymi, gdzie użytkownik może się zalogować i przeglądać dostępne przepisy kulinarne.

Jest możliwość wyświetlenia szczegółów przepisu i generowania listy zakupów do PDF 
na podstawie wyznaczonej ilości porcji danego przepisu



## Authors

- [@Sebastian Mazgaj](https://github.com/Rementai)

## Deployment

To deploy this project, follow the steps below:

### 1. Clone the repository
Clone the project from GitHub to your local machine:

```bash
git clone https://github.com/Rementai/prj-tijo.git
cd your-project
```

### 2. Client (React)
#### 2.1 Install dependencies

Navigate to the client directory and install the required dependencies:
```bash
cd client
npm install
```

#### 2.2 Start the development server

Run the following command to start the React development server:
```bash
npm start
```
The app will be available at http://localhost:3000

### 3. Server (CodeIgniter 4)
#### 3.1 Install Composer dependencies

Navigate to the server directory and install the required Composer dependencies:
```bash
cd ../server
composer install
```

#### 3.2 Configure environment variables

Copy the .env.example file to .env and update the configuration with your database and other environment variables:
```bash
cp .env.example .env
```

#### 3.3 Start the server

Run the following command to start the CodeIgniter 4 development server:
```bash
php spark serve
```
The server will be available at http://localhost:8080.

### 4. Database (MySQL)
#### 4.1 Set up the database

Create a new MySQL database and update the database credentials in the .env file in the server directory.

### OPTIONAL:
Import example database from the project **sample_database** folder.

Once everything is set up, your application should be running locally with the frontend at http://localhost:3000, the backend at http://localhost:8080, and the database connected.

## Manual Test Cases

| ID      | Tytuł                                   | Warunki początkowe                          | Kroki testowe                              | Oczekiwany rezultat                      |
|---------|-----------------------------------------|---------------------------------------------|--------------------------------------------|------------------------------------------|
| TC001   | Test wyświetlania wszystkich przepisów  | Aplikacja jest otwarta na stronie z przepisami | 1. Kliknij nawigację do strony z przepisami. | Wyświetla się lista wszystkich dostępnych przepisów z ich nazwami, obrazkami i miniaturkami. |
| TC002   | Test wyświetlania przepisów według kategorii | Aplikacja jest otwarta na stronie głównej   | 1. Wybierz kategorię z listy. 2. Kliknij kategorię. | Wyświetlają się przepisy należące do wybranej kategorii. |
| TC003   | Test logowania użytkownika              | Aplikacja jest otwarta na stronie logowania | 1. Wprowadź email i hasło. 2. Kliknij "Log in". | Użytkownik zalogowany i przeniesiony na stronę główną. |
| TC004   | Test rejestracji nowego użytkownika     | Aplikacja jest otwarta na stronie rejestracji | 1. Wprowadź dane. 2. Kliknij "Sign up". | Użytkownik zarejestrowany i przeniesiony na stronę główną. |
| TC005   | Test wyszukiwania przepisu              | Aplikacja jest otwarta na stronie głównej przepisów | 1. Wpisz frazę w pasek wyszukiwania.       | Wyświetlają się pasujące przepisy pod paskiem. |
| TC006   | Test zmiany hasła                       | Aplikacja jest otwarta na stronie profilu   | 1. Wprowadź nowe hasło. 2. Powtórz hasło. 3. Kliknij "Update". | Hasło zmienione, użytkownik loguje się nowym hasłem. |
| TC007   | Test generowania listy zakupów w PDF    | Aplikacja jest otwarta na stronie szczegółów przepisu | 1. Kliknij przepis, aby zobaczyć szczegóły. 2. Wybierz liczbę porcji. 3. Kliknij "Generate shopping list". | Generowana lista zakupów w PDF, przeliczona na liczbę porcji. |
| TC008   | Test wylogowania użytkownika            | Aplikacja jest otwarta na stronie głównej   | 1. Kliknij "Log out".                      | Użytkownik wylogowany i przeniesiony na stronę logowania. |
| TC009   | Test błędu przy niepoprawnym logowaniu  | Aplikacja jest otwarta na stronie logowania | 1. Wprowadź niepoprawny email lub hasło. 2. Kliknij "Log in". | Wyświetla się komunikat: "Invalid email or password". |
| TC010   | Test przeliczania składników            | Aplikacja jest otwarta na stronie szczegółów przepisu | 1. Kliknij przepis, aby zobaczyć szczegóły. 2. Zmień liczbę porcji. | Składniki przeliczane dynamicznie na podstawie porcji. |

## Integration and unit tests

The project includes integration and unit tests. These can be found in the following locations:

### Integration tests
- [RecipeIntegrationTest](server/tests/feature/RecipeIntegrationTest.php)
- [CategoryIntegrationTest](server/tests/feature/CategoryIntegrationTest.php)
- [UserIntegrationTest](server/tests/feature/UserIntegrationTest.php)

### Unit tests

- [RecipeTest](server/tests/unit/RecipeTest.php)
- [UserModelTest](server/tests/unit/UserModelTest.php)

## API Reference

[Swagger](https://app.swaggerhub.com/apis-docs/fsfdsafd/dokumentacja-api/1.0)


## Tech Stack

**Client:** React

**Server:** Code Igniter 4

**Database:** MySQL

