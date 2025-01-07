### Лабораторна робота: Використання Secret у Kubernetes

#### Мета:
Навчитися створювати та використовувати Secret у Kubernetes для зберігання конфіденційних даних, таких як паролі, токени та ключі.

#### Завдання:
1. Створити Secret з конфіденційними даними.
2. Використати Secret у поді як змінні середовища.
3. Використати Secret у поді як файл.

#### Кроки виконання:

### 1. Створення Secret

1.1. Створіть файл `secret.yaml` з наступним вмістом:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  username: YWRtaW4=  # base64 encoded value of 'admin'
  password: cGFzc3dvcmQ=  # base64 encoded value of 'password'
```

1.2. Створіть Secret у кластері:

```sh
kubectl apply -f secret.yaml
```

### 2. Використання Secret як змінні середовища

2.1. Створіть файл `pod-env-secret.yaml` з наступним вмістом:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod-env-secret
spec:
  containers:
  - name: my-container
    image: busybox
    command: ['sh', '-c', 'echo $(USERNAME) $(PASSWORD) && sleep 3600']
    env:
    - name: USERNAME
      valueFrom:
        secretKeyRef:
          name: my-secret
          key: username
    - name: PASSWORD
      valueFrom:
        secretKeyRef:
          name: my-secret
          key: password
  restartPolicy: Never
```

2.2. Створіть под у кластері:

```sh
kubectl apply -f pod-env-secret.yaml
```

2.3. Перевірте логи поду, щоб переконатися, що змінні середовища були встановлені:

```sh
kubectl logs my-pod-env-secret
```

### 3. Використання Secret як файл

3.1. Створіть файл `pod-file-secret.yaml` з наступним вмістом:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod-file-secret
spec:
  containers:
  - name: my-container
    image: busybox
    command: ['sh', '-c', 'cat /etc/secret-volume/username /etc/secret-volume/password && sleep 3600']
    volumeMounts:
    - name: secret-volume
      mountPath: /etc/secret-volume
      readOnly: true
  volumes:
  - name: secret-volume
    secret:
      secretName: my-secret
  restartPolicy: Never
```

3.2. Створіть под у кластері:

```sh
kubectl apply -f pod-file-secret.yaml
```

3.3. Перевірте логи поду, щоб переконатися, що файл конфігурації був змонтований:

```sh
kubectl logs my-pod-file-secret
```

### Висновок:
У цій лабораторній роботі ви навчилися створювати Secret у Kubernetes та використовувати його для налаштування подів як через змінні середовища, так і через файли.