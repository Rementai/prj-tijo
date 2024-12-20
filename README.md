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
