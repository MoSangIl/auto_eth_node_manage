# auto_eth_node_manage

Ansible 활용하여 여러 서버에서 Ethereum-Client를 동일환 환경으로 구동 및 관리

- Ansible Control Node: Ansible이 설치 되어 있는 서버로 Managed Node에 원격 작업 담당

  - Unix 기반의 OS에서 구동이 가능

- Ansible Managed Node: Control Node의 원격 작업 대상 서버
  - openssh-server가 설치 되어 있어야 함
  - 본 프로젝트에서는 Ethereum-Client가 구동되는 서버

<img src = "https://github.com/MoSangIl/auto_eth_node_manage/assets/45113627/cb9d70d7-d726-4908-b679-33a3b83616c1" width="50%" height="50%">

## Prerequisite

- Control Node에서 Ansible 설치

```
pip install ansible
// or
apt install ansible
```

- Managed Node에서 ssh 설치

```
apt install openssh-server
```

- Control Node에서 Managed Node ssh 접근을 위한 ssh-key 생성 및 전송

```
// genearte ssh key (rsa)
ssh-keygen

-> keep enter until key generation completed

// transport public key to managed node
ssh-copy-id [username]@[ip]

// test ssh connection
ssh [username]@[ip]
```

_Managed Node OS는 Ubuntu20.04로 진행_

## 실행 방법

- server.ini 정의 (inventory)

```
# managed node ips

[fullnode]
ip1
ip2

[fullnode:vars]
ansible_ssh_private_key_file=~/.ssh/id_rsa # private key path
ansible_user=manged_node_username
ansible_become=true # become sudo previliged
ansible_become_password=1230 # user password

...

[ethereum:vars]
base_path=/path/to/storage-to-store-ethereum-data

...
```

- Control Node에서 Account Management, Execution, Consensus Node 실행 (clef, geth, prysm)

```
ansible-playbook -i server.ini start_eth_client.yaml
```

- Control Node에서 Node 중지 (clef, geth, prysm)

```
ansible-playbook -i server.ini stop_eth_client.yaml
```

## Reference

https://docs.ansible.com/ansible/latest/getting_started/index.html
