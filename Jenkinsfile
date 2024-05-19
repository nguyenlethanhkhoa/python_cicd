pipeline {
    agent any

    // triggers {
    //     githubPullRequest(
    //         useGitHubHooks: true // Enable GitHub webhook integration
    //     )
    // }

    stages {
        stage('Example') {
            agent any
            steps {
                echo ' ------------------------- FEATURE 1 ---------------------------'
                echo env.BRANCH_NAME
            }
        }
    }
}