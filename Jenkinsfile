pipeline {
    agent any

    stages {
        stage('Example') {
            agent any
            steps {
                echo 'Hello World'
                echo 'Step 2'
                echo 'Finish stage Example'
            }
        }
        stage('Do something') {
            agent any
            steps {
                echo 'Do something'
                echo 'Finish'
            }
        }
    }
}