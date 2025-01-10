### Лабораторна робота: Створення StatefulSet у Kubernetes

#### Мета
Навчитися створювати та керувати StatefulSet у Kubernetes для забезпечення стабільних ідентифікаторів та збереження стану для кожного поду.

#### Передумови
- Встановлений Kubernetes кластер
- Встановлений `kubectl`
- Базові знання про Kubernetes

#### Кроки

1. **Налаштування середовища**
   - Переконайтеся, що ваш Kubernetes кластер працює.
   - Перевірте доступність `kubectl`:
     ```bash
     kubectl version --client
     ```

2. **Створення PersistentVolume (PV)**
   ```yaml
   apiVersion: v1
   kind: PersistentVolume
   metadata:
     name: pv-volume
   spec:
     capacity:
       storage: 1Gi
     accessModes:
       - ReadWriteOnce
     hostPath:
       path: "/mnt/data"
   ```

   Застосуйте конфігурацію:
   ```bash
   kubectl apply -f pv.yaml
   ```

3. **Створення PersistentVolumeClaim (PVC)**
   ```yaml
   apiVersion: v1
   kind: PersistentVolumeClaim
   metadata:
     name: pv-claim
   spec:
     accessModes:
       - ReadWriteOnce
     resources:
       requests:
         storage: 1Gi
   ```

   Застосуйте конфігурацію:
   ```bash
   kubectl apply -f pvc.yaml
   ```

4. **Створення StatefulSet**
   ```yaml
   apiVersion: apps/v1
   kind: StatefulSet
   metadata:
     name: web
   spec:
     serviceName: "nginx"
     replicas: 3
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
           ports:
           - containerPort: 80
             name: web
           volumeMounts:
           - name: www
             mountPath: /usr/share/nginx/html
     volumeClaimTemplates:
     - metadata:
         name: www
       spec:
         accessModes: [ "ReadWriteOnce" ]
         resources:
           requests:
             storage: 1Gi
   ```

   Застосуйте конфігурацію:
   ```bash
   kubectl apply -f statefulset.yaml
   ```

5. **Створення Headless Service**
   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: nginx
   spec:
     ports:
     - port: 80
       name: web
     clusterIP: None
     selector:
       app: nginx
   ```

   Застосуйте конфігурацію:
   ```bash
   kubectl apply -f service.yaml
   ```

6. **Перевірка створених ресурсів**
   - Перевірте StatefulSet:
     ```bash
     kubectl get statefulsets
     ```
   - Перевірте поди:
     ```bash
     kubectl get pods
     ```
   - Перевірте PVC:
     ```bash
     kubectl get pvc
     ```

7. **Тестування доступу до подів**
   - Отримайте список подів:
     ```bash
     kubectl get pods -l app=nginx
     ```
   - Підключіться до одного з подів:
     ```bash
     kubectl exec -it <pod-name> -- /bin/bash
     ```

#### Висновок
Ви навчилися створювати StatefulSet у Kubernetes, налаштовувати PersistentVolume та PersistentVolumeClaim, а також створювати Headless Service для забезпечення стабільних ідентифікаторів подів.