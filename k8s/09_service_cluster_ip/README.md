### Лабораторна робота: Створення сервісу типу ClusterIP в Kubernetes

#### Мета:
Навчитися створювати сервіс типу ClusterIP для доступу до подів всередині кластера Kubernetes.

#### Кроки:

1. **Створення Deployment:**
   Спочатку створимо Deployment, який буде розгортати наш додаток.

2. **Створення Service:**
   Потім створимо Service типу ClusterIP для доступу до подів, створених Deployment.

### 1. Створення Deployment

Створіть файл `deployment.yaml` з наступним вмістом:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp-container
        image: nginx:latest
        ports:
        - containerPort: 80
```

### 2. Створення Service

Створіть файл `service.yaml` з наступним вмістом:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: myapp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: ClusterIP
```

### 3. Застосування конфігурацій

Відкрийте термінал і виконайте наступні команди для застосування конфігурацій:

```sh
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### 4. Перевірка створених ресурсів

Перевірте, чи були створені Deployment і Service:

```sh
kubectl get deployments
kubectl get services
```

### 5. Доступ до сервісу

Сервіс типу ClusterIP доступний тільки всередині кластера. Ви можете використовувати команду `kubectl port-forward` для доступу до сервісу з вашого локального комп'ютера:

```sh
kubectl port-forward svc/my-service 8080:80
```

Тепер ви можете відкрити браузер і перейти за адресою `http://localhost:8080`, щоб побачити ваш додаток.

### Висновок

Ви успішно створили Deployment і Service типу ClusterIP в Kubernetes. Сервіс типу ClusterIP дозволяє отримати доступ до подів всередині кластера, забезпечуючи стабільну IP-адресу і DNS-ім'я для набору подів.