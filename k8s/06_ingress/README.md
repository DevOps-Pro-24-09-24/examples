### Лабораторна робота: Використання Ingress у Kubernetes

#### Мета:
Навчитися налаштовувати Ingress у Kubernetes для маршрутизації HTTP/HTTPS трафіку до сервісів у кластері.

#### Завдання:
1. Створити Deployment та Service.
2. Налаштувати Ingress для маршрутизації трафіку до Service.
3. Перевірити доступність сервісу через Ingress.

#### Кроки виконання:

### 1. Створення Deployment та Service

1.1. Створіть файл `deployment.yaml` з наступним вмістом:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 2
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

1.2. Створіть файл `service.yaml` з наступним вмістом:

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
  type: ClusterIP
```

1.3. Створіть Deployment та Service у кластері:

```sh
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### 2. Налаштування Ingress

2.1. Переконайтеся, що у вашому кластері встановлений Ingress Controller. Якщо ні, встановіть його (наприклад, NGINX Ingress Controller):

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
```

2.2. Створіть файл `ingress.yaml` з наступним вмістом:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: my-app.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: my-service
            port:
              number: 80
```

2.3. Створіть Ingress у кластері:

```sh
kubectl apply -f ingress.yaml
```

### 3. Перевірка доступності сервісу через Ingress

3.1. Додайте запис у файл `/etc/hosts` на вашій локальній машині для маршрутизації домену `my-app.local` до IP-адреси Ingress Controller:

```sh
sudo nano /etc/hosts
```

Додайте рядок:

```
<INGRESS_CONTROLLER_IP> my-app.local
```

3.2. Перевірте доступність сервісу через браузер або команду `curl`:

```sh
curl http://my-app.local
```

### Висновок:
У цій лабораторній роботі ви навчилися створювати Deployment та Service, налаштовувати Ingress для маршрутизації HTTP/HTTPS трафіку до сервісів у кластері та перевіряти доступність сервісу через Ingress.