// Jenkins
pipeline {
    // Defines where the pipeline will run. 'any' means any available agentd (node).
    agent any 

    // Optional: Global environment variables for the entire pipelines
    environment {
        // You would typically use Jenkins Credentials for actual sensitive tokens
        // GIT_CREDENTIALS_ID = 'your-github-credential-id' 
        REPO = 'https://github.com/reddy-sv/Devops'
        BRANCH = 'jenkins'
    }

    // Stages define a conceptual division of the workss (e.g., Build, Test, Deploy)
    stages {
        stage('Checkout Source Code') {
            steps {
                // The 'checkout scm' step uses the SCM configuration from the
                // Jenkins job configuration (where you linked the GitHub repo).
                // Alternatively, you can explicitly use the 'git' step:
                // git url: "https://github.com/${REPO}.git", branch: "${BRANCH}", credentialsId: "${GIT_CREDENTIALS_ID}"

                checkout scm
                echo "Source code checked out successfully."
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
                // Replace with your actual build command (e.g., mvn clean install, npm run build)
                sh 'echo "Running a mock build command..."' 
            }
        }

        stage('Test') {
            steps {
                echo 'Running unit tests...'
                // Replace with your actual test command (e.g., mvn test, npm test)
                sh 'echo "Running a mock test command..."'

                // Optional: Publish test results (if using JUnit or similar)
                // junit '**/target/surefire-reports/*.xml' 
            }
        }

        stage('Deploy (Staging)') {
            // Only run this stage if the previous stages passed
            when {
                branch 'main' // Example: only deploy main branch to staging
            }
            steps {
                echo 'Deploying to Staging environment...'
                // Replace with actual deployment steps (e.g., Docker, Kubernetes, Ansible)
                sh 'echo "Mock deployment to Staging complete."'
            }
        }
    }

    // Optional: Define actions to take after the pipeline has finished
    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded! Sending notification.'
        }
        failure {
            echo 'Pipeline failed! Check the logs.'
        }
    }
}

