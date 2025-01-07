### Лабораторна робота: Використання ConfigMap у Kubernetes

#### Мета:
Навчитися створювати та використовувати ConfigMap у Kubernetes для зберігання конфігураційних даних, які можуть бути використані подами.

#### Завдання:
1. Створити ConfigMap з конфігураційними даними.
2. Використати ConfigMap у поді як змінні середовища.
3. Використати ConfigMap у поді як файл конфігурації.

#### Кроки виконання:

### 1. Створення ConfigMap

1.1. Створіть файл `configmap.yaml` з наступним вмістом:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  APP_ENV: "production"
  APP_DEBUG: "false"
  CONFIG_FILE: |
    key1=value1
    key2=value2
```

1.2. Створіть ConfigMap у кластері:

```sh
kubectl apply -f configmap.yaml
```

### 2. Використання ConfigMap як змінні середовища

2.1. Створіть файл `pod-env.yaml` з наступним вмістом:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod-env
spec:
  containers:
  - name: my-container
    image: busybox
    command: ['sh', '-c', 'echo $(APP_ENV) $(APP_DEBUG) && sleep 3600']
    env:
    - name: APP_ENV
      valueFrom:
        configMapKeyRef:
          name: my-config
          key: APP_ENV
    - name: APP_DEBUG
      valueFrom:
        configMapKeyRef:
          name: my-config
          key: APP_DEBUG
  restartPolicy: Never
```

2.2. Створіть под у кластері:

```sh
kubectl apply -f pod-env.yaml
```

2.3. Перевірте логи поду, щоб переконатися, що змінні середовища були встановлені:

```sh
kubectl logs my-pod-env
```

### 3. Використання ConfigMap як файл конфігурації

3.1. Створіть файл `pod-config-file.yaml` з наступним вмістом:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod-config-file
spec:
  containers:
  - name: my-container
    image: busybox
    command: ['sh', '-c', 'cat /etc/config/CONFIG_FILE && sleep 3600']
    volumeMounts:
    - name: config-volume
      mountPath: /etc/config
  volumes:
  - name: config-volume
    configMap:
      name: my-config
  restartPolicy: Never
```

3.2. Створіть под у кластері:

```sh
kubectl apply -f pod-config-file.yaml
```

3.3. Перевірте логи поду, щоб переконатися, що файл конфігурації був змонтований:

```sh
kubectl logs my-pod-config-file
```

### Висновок:
У цій лабораторній роботі ви навчилися створювати ConfigMap у Kubernetes та використовувати його для налаштування подів як через змінні середовища, так і через файли конфігурації.