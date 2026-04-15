@echo off

mkdir ai-hpa
cd ai-hpa

echo from flask import Flask> app.py
echo app = Flask(__name__)>> app.py
echo @app.route("/")>> app.py
echo def home():>> app.py
echo     return "AI App Running">> app.py
echo if __name__ == "__main__":>> app.py
echo     app.run(host="0.0.0.0", port=5000)>> app.py

echo flask> requirements.txt

echo FROM python:3.9> Dockerfile
echo WORKDIR /app>> Dockerfile
echo COPY . .>> Dockerfile
echo RUN pip install -r requirements.txt>> Dockerfile
echo CMD ["python", "app.py"]>> Dockerfile

echo apiVersion: apps/v1> deployment.yaml
echo kind: Deployment>> deployment.yaml
echo metadata:>> deployment.yaml
echo   name: ai-app>> deployment.yaml
echo spec:>> deployment.yaml
echo   replicas: 2>> deployment.yaml
echo   selector:>> deployment.yaml
echo     matchLabels:>> deployment.yaml
echo       app: ai-app>> deployment.yaml
echo   template:>> deployment.yaml
echo     metadata:>> deployment.yaml
echo       labels:>> deployment.yaml
echo         app: ai-app>> deployment.yaml
echo     spec:>> deployment.yaml
echo       containers:>> deployment.yaml
echo       - name: ai-container>> deployment.yaml
echo         image: ai-model>> deployment.yaml
echo         imagePullPolicy: Never>> deployment.yaml
echo         ports:>> deployment.yaml
echo         - containerPort: 5000>> deployment.yaml

echo apiVersion: v1> service.yaml
echo kind: Service>> service.yaml
echo metadata:>> service.yaml
echo   name: ai-service>> service.yaml
echo spec:>> service.yaml
echo   type: NodePort>> service.yaml
echo   selector:>> service.yaml
echo     app: ai-app>> service.yaml
echo   ports:>> service.yaml
echo   - port: 5000>> service.yaml
echo     targetPort: 5000>> service.yaml
echo     nodePort: 30007>> service.yaml

pause
