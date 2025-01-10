### Лабораторна робота: Створення власного Helm Chart

#### Мета
Навчитися створювати власний Helm Chart для розгортання додатків у Kubernetes.

#### Передумови
- Встановлений Kubernetes кластер
- Встановлений Helm 3
- Базові знання про Kubernetes та Helm

#### Кроки

1. **Налаштування середовища**
   - Переконайтеся, що ваш Kubernetes кластер працює.
   - Перевірте доступність `kubectl`:
     ```bash
     kubectl version --client
     ```
   - Перевірте доступність Helm:
     ```bash
     helm version
     ```

2. **Створення нового Helm Chart**
   - Створіть новий Helm Chart за допомогою команди:
     ```bash
     helm create mychart
     ```
   - Перейдіть до створеного каталогу:
     ```bash
     cd mychart
     ```

3. **Структура Helm Chart**
   - Ознайомтеся зі структурою каталогу:
     ```
     mychart/
     ├── Chart.yaml
     ├── values.yaml
     ├── charts/
     ├── templates/
     │   ├── deployment.yaml
     │   ├── _helpers.tpl
     │   ├── hpa.yaml
     │   ├── ingress.yaml
     │   ├── NOTES.txt
     │   ├── service.yaml
     │   └── serviceaccount.yaml
     └── .helmignore
     ```

4. **Редагування Chart.yaml**
   - Відкрийте файл `Chart.yaml` і відредагуйте його, щоб він відповідав вашому додатку:
     ```yaml
     apiVersion: v2
     name: mychart
     description: A Helm chart for Kubernetes
     version: 0.1.0
     appVersion: "1.0"
     ```

5. **Редагування values.yaml**
   - Відкрийте файл `values.yaml` і налаштуйте значення за замовчуванням для вашого додатку:
     ```yaml
     replicaCount: 1

     image:
       repository: nginx
       pullPolicy: IfNotPresent
       tag: "1.16.0"

     service:
       type: ClusterIP
       port: 80

     ingress:
       enabled: false
       annotations: {}
       hosts:
         - host: chart-example.local
           paths: []
       tls: []

     resources: {}

     nodeSelector: {}

     tolerations: []

     affinity: {}
     ```

6. **Редагування шаблонів**
   - Відкрийте файл `templates/deployment.yaml` і налаштуйте його для вашого додатку:
     ```yaml
     apiVersion: apps/v1
     kind: Deployment
     metadata:
       name: {{ include "mychart.fullname" . }}
       labels:
         {{- include "mychart.labels" . | nindent 4 }}
     spec:
       replicas: {{ .Values.replicaCount }}
       selector:
         matchLabels:
           {{- include "mychart.selectorLabels" . | nindent 6 }}
       template:
         metadata:
           labels:
             {{- include "mychart.selectorLabels" . | nindent 8 }}
         spec:
           containers:
             - name: {{ .Chart.Name }}
               image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
               imagePullPolicy: {{ .Values.image.pullPolicy }}
               ports:
                 - name: http
                   containerPort: 80
                   protocol: TCP
               resources:
                 {{- toYaml .Values.resources | nindent 12 }}
     ```

7. **Встановлення Helm Chart**
   - Встановіть ваш Helm Chart у Kubernetes кластер:
     ```bash
     helm install myrelease ./mychart
     ```

8. **Перевірка встановлення**
   - Перевірте, чи було успішно встановлено ваш додаток:
     ```bash
     kubectl get all
     ```

9. **Оновлення Helm Chart**
   - Внесіть зміни до вашого Helm Chart і оновіть реліз:
     ```bash
     helm upgrade myrelease ./mychart
     ```

10. **Видалення Helm Chart**
    - Видаліть реліз з кластера:
      ```bash
      helm uninstall myrelease
      ```

#### Висновок
Ви навчилися створювати власний Helm Chart, налаштовувати його для вашого додатку, встановлювати, оновлювати та видаляти його з Kubernetes кластера.