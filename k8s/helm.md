### Helm Cheat Sheet для Kubernetes

#### Основні команди

- **Ініціалізація Helm (Helm 2)**
  ```bash
  helm init
  ```

- **Додавання репозиторію**
  ```bash
  helm repo add <repo_name> <repo_url>
  ```

- **Оновлення репозиторію**
  ```bash
  helm repo update
  ```

- **Пошук чартів**
  ```bash
  helm search repo <chart_name>
  ```

- **Інсталяція чарту**
  ```bash
  helm install <release_name> <chart_name>
  ```

- **Оновлення релізу**
  ```bash
  helm upgrade <release_name> <chart_name>
  ```

- **Перегляд встановлених релізів**
  ```bash
  helm list
  ```

- **Видалення релізу**
  ```bash
  helm uninstall <release_name>
  ```

#### Робота з чартами

- **Створення нового чарту**
  ```bash
  helm create <chart_name>
  ```

- **Перегляд значень за замовчуванням**
  ```bash
  helm show values <chart_name>
  ```

- **Перегляд деталей чарту**
  ```bash
  helm show chart <chart_name>
  ```

- **Перегляд README чарту**
  ```bash
  helm show readme <chart_name>
  ```

#### Налаштування

- **Інсталяція з користувацькими значеннями**
  ```bash
  helm install <release_name> <chart_name> --values <values_file.yaml>
  ```

- **Оновлення з користувацькими значеннями**
  ```bash
  helm upgrade <release_name> <chart_name> --values <values_file.yaml>
  ```

- **Перегляд значень релізу**
  ```bash
  helm get values <release_name>
  ```

#### Дебагінг

- **Перевірка чарту**
  ```bash
  helm lint <chart_name>
  ```

- **Перевірка шаблонів**
  ```bash
  helm template <chart_name>
  ```

- **Перегляд журналів релізу**
  ```bash
  helm get all <release_name>
  ```

#### Робота з репозиторіями

- **Список репозиторіїв**
  ```bash
  helm repo list
  ```

- **Видалення репозиторію**
  ```bash
  helm repo remove <repo_name>
  ```

- **Показати версії чарту**
  ```bash
  helm search repo <chart_name> --versions
  ```