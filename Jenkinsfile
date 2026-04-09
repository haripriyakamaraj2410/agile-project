apiVersion: apps/v1
kind: Deployment
metadata:
  name: ecommerce-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: ecommerce
  template:
    metadata:
      labels:
        app: ecommerce
    spec:
      containers:
      - name: ecommerce-container
        image: haripriyakamaraj2410/ecommerce-app:latest
        ports:
        - containerPort: 80
