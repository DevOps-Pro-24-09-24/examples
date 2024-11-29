
```shell
ansible-vault encrypt secrets.yml
ansible-playbook playbook.yml --ask-vault-pass
```


### План:
1. Використати команду `ansible-vault encrypt_string` для шифрування окремої змінної.
2. Додати зашифровану змінну до плейбука Ansible.

### Код:

#### 1. Шифрування окремої змінної
Виконайте команду в терміналі:
```sh
ansible-vault encrypt_string 'mysecretpassword' --name 'db_password'
```
Вихід буде виглядати приблизно так:
```yaml
db_password: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          6162636465666768696a6b6c6d6e6f70
          7172737475767778797a7b7c7d7e7f80
          8182838485868788898a8b8c8d8e8f90
          9192939495969798999a9b9c9d9e9f00
```

#### 2. Додавання зашифрованої змінної до плейбука Ansible
```yaml
# playbook.yml
- hosts: localhost
  vars:
    db_password: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          6162636465666768696a6b6c6d6e6f70
          7172737475767778797a7b7c7d7e7f80
          8182838485868788898a8b8c8d8e8f90
          9192939495969798999a9b9c9d9e9f00
  tasks:
    - name: Print the database password
      debug:
        msg: "The database password is {{ db_password }}"
```

#### 3. Запуск плейбука з Ansible Vault
Виконайте команду в терміналі:
```sh
ansible-playbook playbook.yml --ask-vault-pass
```
Вас попросять ввести пароль для розшифрування.