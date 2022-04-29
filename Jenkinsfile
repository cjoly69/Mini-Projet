pipeline {
     environment {
       IMAGE_NAME = "static_website_ib"
       IMAGE_TAG = "v1"
       /* STAGING = "choco1992-staging"
       PRODUCTION = "choco1992-production" */
       DOCKERHUB_PASSWORD = credentials(docker_pwd)
     }
     agent none
     stages {
         stage('Build image') {
             agent any
             steps {
                script {
                  sh 'docker build -t cjoly69/$IMAGE_NAME:$IMAGE_TAG .'
                }
             }
        }
        stage('Run container based on builded image') {
            agent any
            steps {
               script {
                 sh '''
                    docker run --name $IMAGE_NAME -d -p 80:80 -e PORT=80 cjoly69/$IMAGE_NAME:$IMAGE_TAG
                    sleep 5
                 '''
               }
            }
       }
       stage('Test image') {
           agent any
           steps {
              script {
                sh '''
                    curl http://jenkins | grep -i "dimension"
                '''
              }
           }
      }
      stage('Clean Container') {
          agent any
          steps {
             script {
               sh '''
                 docker stop $IMAGE_NAME
                 docker rm $IMAGE_NAME
               '''
             }
          }
     }
     stage ('Login and Push Image on docker hub') {
          agent any
          steps {
             script {
               sh '''
                   echo $DOCKERHUB_PASSWORD | docker login -u $ID_DOCKER --password-stdin
                   docker push cjoly69/$IMAGE_NAME:$IMAGE_TAG
               '''
             }
          }
      }    
     stage('Push image in staging and deploy it') {
       when {
              expression { GIT_BRANCH == 'origin/main' }
            }
      agent any
      /* environment {
          HEROKU_API_KEY = credentials('heroku_api_key')
      }   */
      steps {
          script {
            sh '''
              echo "Deploiement en cours"
            '''
          }
        }
     }
     stage('Push image in production and deploy it') {
       when {
              expression { GIT_BRANCH == 'origin/master' }
            }

     }
  }
}
