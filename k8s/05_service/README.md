### Лабораторна робота: Використання Service у Kubernetes

#### Мета:
Навчитися створювати та використовувати Service у Kubernetes для забезпечення доступу до подів.

#### Завдання:
1. Створити Deployment для запуску подів.
2. Створити Service для доступу до подів.
3. Перевірити доступність подів через Service.

#### Кроки виконання:

### 1. Створення Deployment

1.1. Створіть файл `deployment.yaml` з наступним вмістом:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-container
        image: nginx
        ports:
        - containerPort: 80
```

1.2. Створіть Deployment у кластері:

```sh
kubectl apply -f deployment.yaml
```

### 2. Створення Service

2.1. Створіть файл `service.yaml` з наступним вмістом:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: my-app
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
  type: LoadBalancer
```

2.2. Створіть Service у кластері:

```sh
kubectl apply -f service.yaml
```

### 3. Перевірка доступності подів через Service

3.1. Отримайте інформацію про Service:

```sh
kubectl get services
```

3.2. Знайдіть зовнішній IP-адресу (EXTERNAL-IP) вашого Service. Це може зайняти деякий час, поки IP-адреса буде призначена.

3.3. Перевірте доступність подів через браузер або команду `curl`, використовуючи зовнішній IP-адресу:

```sh
curl http://<EXTERNAL-IP>
```

### Висновок:
У цій лабораторній роботі ви навчилися створювати Deployment для запуску подів та Service для забезпечення доступу до цих подів. Ви також перевірили доступність подів через Service.