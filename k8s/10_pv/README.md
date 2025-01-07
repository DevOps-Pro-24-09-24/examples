### Лабораторна робота: Використання PersistentVolume (PV) та PersistentVolumeClaim (PVC) з підтримкою hostPath в Kubernetes

#### Крок 1: Створення PersistentVolume (PV)

Створіть файл `persistentvolume.yaml` з наступним вмістом:

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/data
```

#### Крок 2: Створення PersistentVolumeClaim (PVC)

Створіть файл `persistentvolumeclaim.yaml` з наступним вмістом:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

#### Крок 3: Застосування конфігурацій PV та PVC

Відкрийте термінал і виконайте наступні команди для застосування конфігурацій:

```sh
kubectl apply -f persistentvolume.yaml
kubectl apply -f persistentvolumeclaim.yaml
```

#### Крок 4: Перевірка створених ресурсів

Перевірте, чи були створені PV і PVC:

```sh
kubectl get pv
kubectl get pvc
```

#### Крок 5: Використання PVC в Pod

Створіть файл `pod.yaml` з наступним вмістом, щоб використовувати PVC в Pod:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: my-container
    image: nginx:latest
    volumeMounts:
    - mountPath: "/usr/share/nginx/html"
      name: my-storage
  volumes:
  - name: my-storage
    persistentVolumeClaim:
      claimName: my-pvc
```

#### Крок 6: Застосування конфігурації Pod

Виконайте наступну команду для створення Pod:

```sh
kubectl apply -f pod.yaml
```

#### Крок 7: Перевірка стану Pod

Перевірте стан Pod, щоб переконатися, що він працює і використовує PVC:

```sh
kubectl get pods
```

#### Крок 8: Перевірка монтування тома

Виконайте команду для входу в Pod і перевірте, чи змонтований том:

```sh
kubectl exec -it my-pod -- /bin/sh
```

Після входу в Pod, перевірте вміст змонтованого каталогу:

```sh
ls /usr/share/nginx/html
```

### Висновок

Ця лабораторна робота демонструє, як створити PersistentVolume (PV) з підтримкою hostPath, PersistentVolumeClaim (PVC) для запиту зберігання, і як використовувати PVC в Pod для зберігання даних.