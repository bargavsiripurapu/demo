node{
    stage('Scm Checkout'){
        git branch: 'main', credentialsId: 'git_hub', url: 'https://github.com/bargavsiripurapu/flask_demo_Latest.git'
    }
    stage('Mvn Package'){
        def mvnHome = tool name: 'maven-3', type: 'maven'
        sh "${mvnHome}/bin/mvn clean package"
    }
    stage('Build Docker Image'){
        sh 'docker build -t devopshub123/flask_demo_latest:2.0.0 .'
    }
        stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerHubPwd')]) {
        sh "docker login -u devopshub123 -p ${dockerHubPwd}"
        }
     sh 'docker push devopshub123/flask_demo_latest:2.0.0'
    }
    stage('Run Container on dev-server'){
        def dockerRun = 'docker run -p 9090:9090 -d --name flask_demo_latest devopshub123/flask_demo_latest:2.0.0'
        sshagent(['dev-server']) {
        sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.1.184 ${dockerRun}"
        }
    }
}
