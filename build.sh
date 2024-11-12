#!/bin/bash
 TAG=v1
 USERNAME=first022
 DOCKERFILE=Dockerfile.production
 BACKEND=his-finance-backend
 FRONTEND=his-finance-frontend
 PLUGIN=his-finance-reimbursement
 docker login
 echo "========== Building BACKEND =========="
 docker build --platform linux/amd64 -t ${USERNAME}/${BACKEND}:${TAG} -f ${BACKEND}/${DOCKERFILE} 
./${BACKEND}
 docker push ${USERNAME}/${BACKEND}:${TAG}
 echo "========== Building FRONTEND =========="
 docker build --platform linux/amd64 -t ${USERNAME}/${FRONTEND}:${TAG} -f ${FRONTEND}/${DOCKERFILE} 
./${FRONTEND}
 docker push ${USERNAME}/${FRONTEND}:${TAG}
 echo "========== Building PLUGIN =========="
 docker build --platform linux/amd64 -t ${USERNAME}/${PLUGIN}:${TAG} -f ${PLUGIN}/${DOCKERFILE} ./${PLUGIN}
 docker push ${USERNAME}/${PLUGIN}:${TAG}