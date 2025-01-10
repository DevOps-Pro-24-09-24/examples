### Лабораторна робота: Автоматичне вертикальне масштабування Deployment у Kubernetes

#### Мета
Навчитися створювати Deployment у Kubernetes та налаштовувати автоматичне вертикальне масштабування за допомогою Vertical Pod Autoscaler (VPA).

#### Передумови
- Встановлений Kubernetes кластер
- Встановлений `kubectl`
- Встановлений Vertical Pod Autoscaler (VPA)
- Базові знання про Kubernetes

#### Кроки

1. **Налаштування середовища**
   - Переконайтеся, що ваш Kubernetes кластер працює.
   - Перевірте доступність `kubectl`:
     ```bash
     kubectl version --client
     ```

2. **Встановлення Vertical Pod Autoscaler (VPA)**
   - Встановіть VPA у вашому кластері, якщо він ще не встановлений:
     ```bash
     kubectl apply -f https://github.com/kubernetes/autoscaler/releases/download/vpa-release-0.9.2/vpa-v0.9.2.yaml
     ```

3. **Створення Deployment**
   Створіть файл `deployment.yaml` з наступним вмістом:
   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: nginx-deployment
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
       spec:
         containers:
         - name: nginx
           image: nginx:1.14.2
           resources:
             requests:
               cpu: "100m"
               memory: "128Mi"
             limits:
               cpu: "500m"
               memory: "512Mi"
           ports:
           - containerPort: 80
   ```

   Застосуйте конфігурацію:
   ```bash
   kubectl apply -f deployment.yaml
   ```

4. **Перевірка створеного Deployment**
   - Перевірте Deployment:
     ```bash
     kubectl get deployments
     ```
   - Перевірте поди:
     ```bash
     kubectl get pods
     ```

5. **Створення Vertical Pod Autoscaler (VPA)**
   Створіть файл `vpa.yaml` з наступним вмістом:
   ```yaml
   apiVersion: autoscaling.k8s.io/v1
   kind: VerticalPodAutoscaler
   metadata:
     name: nginx-vpa
   spec:
     targetRef:
       apiVersion: "apps/v1"
       kind:       Deployment
       name:       nginx-deployment
     updatePolicy:
       updateMode: "Auto"
   ```

   Застосуйте конфігурацію:
   ```bash
   kubectl apply -f vpa.yaml
   ```

6. **Створення навантаження для тестування VPA**
   - Встановіть `kubectl` плагін для створення навантаження:
     ```bash
     kubectl run -i --tty load-generator --image=busybox /bin/sh
     ```
   - У контейнері `load-generator` виконайте команду для створення навантаження:
     ```sh
     while true; do wget -q -O- http://nginx-service; done
     ```

7. **Перевірка масштабування**
   - Перевірте стан VPA:
     ```bash
     kubectl describe vpa nginx-vpa
     ```
   - Перевірте ресурси подів:
     ```bash
     kubectl get pods -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.containers[*].resources}{"\n"}{end}'
     ```

8. **Зупинка навантаження**
   - Зупиніть контейнер `load-generator`:
     ```sh
     exit
     ```

9. **Перевірка зменшення ресурсів**
   - Перевірте ресурси подів після зупинки навантаження:
     ```bash
     kubectl get pods -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.containers[*].resources}{"\n"}{end}'
     ```

#### Висновок
Ви навчилися створювати Deployment у Kubernetes, налаштовувати автоматичне вертикальне масштабування за допомогою Vertical Pod Autoscaler (VPA), а також тестувати масштабування за допомогою створення навантаження.