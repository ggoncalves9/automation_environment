#!/bin/bash
# Script de menu para executar comandos do Kubernetes

while true; do
  clear
  echo "========================================"
  echo "           MENU DE COMANDOS             "
  echo "========================================"
  echo "1) Executar kubeadm init"
  echo "2) Aplicar kube-router"
  echo "3) Aplicar website_base (nginx-app)"
  echo "4) Aplicar website_nasa"
  echo "5) Remover taint do master"
  echo "0) Sair"
  echo "========================================"
  read -p "Escolha uma opção: " opcao

  case $opcao in
    1)
      echo "Executando: kubeadm init --apiserver-advertise-address \$(hostname -i) --pod-network-cidr 10.5.0.0/16"
      kubeadm init --apiserver-advertise-address "$(hostname -i)" --pod-network-cidr 10.5.0.0/16
      read -p "Pressione Enter para continuar..."
      ;;
    2)
      echo "Aplicando kube-router"
      kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
      read -p "Pressione Enter para continuar..."
      ;;
    3)
      echo "Aplicando website_base (nginx-app)"
      kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/nginx-app.yaml
      read -p "Pressione Enter para continuar..."
      ;;
    4)
      echo "Aplicando website_nasa"
      kubectl apply -f https://raw.githubusercontent.com/ggoncalves9/automation_environment/refs/heads/main/deploy.yaml
      read -p "Pressione Enter para continuar..."
      ;;
    5)
      echo "Removendo taint do master"
      kubectl taint nodes "$(hostname)" node-role.kubernetes.io/control-plane:NoSchedule-
      read -p "Pressione Enter para continuar..."
      ;;
    6)
      echo "Removendo taint do master"
      https://raw.githubusercontent.com/ggoncalves9/automation_environment/refs/heads/main/k8s/wordpress-mysql.yaml
      read -p "Pressione Enter para continuar..."
      ;;
    0)
      echo "Saindo..."
      exit 0
      ;;
    *)
      echo "Opção inválida! Tente novamente."
      sleep 2
      ;;
  esac
done
