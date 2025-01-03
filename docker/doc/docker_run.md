Команда `docker run` використовується для створення та запуску контейнерів з образів Docker. Вона має багато опцій, які дозволяють налаштувати поведінку контейнера. Ось основний синтаксис та деякі приклади використання:

### Основний синтаксис

```sh
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

### Приклади використання

1. **Запуск контейнера з образу**

```sh
docker run ubuntu
```

Ця команда завантажить образ `ubuntu` (якщо він ще не завантажений) і запустить контейнер з цим образом.

2. **Запуск контейнера з інтерактивним терміналом**

```sh
docker run -it ubuntu /bin/bash
```

Опції `-it` дозволяють запустити контейнер в інтерактивному режимі з підключеним терміналом, що дозволяє взаємодіяти з контейнером через командний рядок.

3. **Запуск контейнера у фоновому режимі (демон)**

```sh
docker run -d nginx
```

Опція `-d` запускає контейнер у фоновому режимі (демон). У цьому прикладі запускається веб-сервер `nginx`.

4. **Прив'язка портів**

```sh
docker run -d -p 8080:80 nginx
```

Опція `-p` прив'язує порт хостової машини до порту контейнера. У цьому прикладі порт 8080 на хості буде перенаправлений на порт 80 в контейнері.

5. **Прив'язка томів**

```sh
docker run -v /host/path:/container/path myimage
```

Опція `-v` дозволяє прив'язати директорію з хостової машини до директорії в контейнері. Це корисно для зберігання даних або спільного використання файлів між хостом і контейнером.

6. **Задання змінних середовища**

```sh
docker run -e MY_ENV_VAR=value myimage
```

Опція `-e` дозволяє задати змінні середовища для контейнера.

### Додаткові опції

- `--name` задає ім'я контейнера.
- `--rm` автоматично видаляє контейнер після його зупинки.
- `--network` задає мережу, до якої буде підключений контейнер.

### Приклад з кількома опціями

```sh
docker run -d --name mynginx -p 8080:80 -v /my/data:/data nginx
```

Ця команда запускає контейнер `nginx` у фоновому режимі з ім'ям `mynginx`, прив'язує порт 8080 на хості до порту 80 в контейнері та монтує директорію `/my/data` з хостової машини до `/data` в контейнері.

Команда `docker run` є дуже гнучкою і дозволяє налаштувати контейнер під різні потреби.