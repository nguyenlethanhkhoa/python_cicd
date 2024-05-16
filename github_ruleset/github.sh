function get_user_repos {
    curl -L -s --output ./.temp/repos.json \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer ${TOKEN}" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        https://api.github.com/users/${USERNAME}/repos

    jq -r '.[] | .name' ./.temp/repos.json
}

function create_develop_brand_protection_rules {
    curl --location "https://api.github.com/repos/${USERNAME}/${REPO}/rulesets" \
        --header 'Accept: application/vnd.github+json' \
        --header 'X-GitHub-Api-Version: 2022-11-28' \
        --header 'Content-Type: application/json' \
        --header "Authorization: Bearer ${TOKEN}" \
        --data '{
        "name": "develop brand protection rules",
        "target": "branch",
        "enforcement": "active",
        "bypass_actors": [],
        "conditions": {
            "ref_name": {
                "include": [
                    "refs/heads/develop"
                ],
                "exclude": []
            }
        },
        "rules": [
            {
                "type": "deletion",
                "parameters": {}
            },
            {
                "type": "non_fast_forward",
                "parameters": {}
            },
            {
                "type": "pull_request",
                "parameters": {
                    "required_approving_review_count": 1,
                    "dismiss_stale_reviews_on_push": true,
                    "require_code_owner_review": true,
                    "require_last_push_approval": false,
                    "required_review_thread_resolution": false
                }
            },
            {
                "type": "required_status_checks",
                "parameters": {
                    "strict_required_status_checks_policy": true,
                    "required_status_checks": [
                        {
                            "context": "dev-test"
                        }
                    ]
                }
            }
        ]
    }'
}

function create_main_brand_protection_rules {
   curl --location "https://api.github.com/repos/${USERNAME}/${REPO}/rulesets" \
        --header 'Accept: application/vnd.github+json' \
        --header 'X-GitHub-Api-Version: 2022-11-28' \
        --header 'Content-Type: application/json' \
        --header "Authorization: Bearer ${TOKEN}" \
        --data '{
    "name": "main brand protection rules",
    "target": "branch",
    "enforcement": "active",
    "bypass_actors": [],
    "conditions": {
        "ref_name": {
            "include": [
                "refs/heads/main"
            ],
            "exclude": []
        }
    },
    "rules": [
        {
            "type": "deletion",
            "parameters": {}
        },
        {
            "type": "non_fast_forward",
            "parameters": {}
        },
        {
            "type": "pull_request",
            "parameters": {
                "require_code_owner_review": false,
                "require_last_push_approval": true,
                "dismiss_stale_reviews_on_push": false,
                "required_approving_review_count": 1,
                "authorized_dismissal_actors_only": false,
                "required_review_thread_resolution": false,
                "ignore_approvals_from_contributors": false
            }
        },
        {
            "type": "required_status_checks",
            "parameters": {
                "required_status_checks": [
                    {
                        "context": "rc_test"
                    },
                    {
                        "context": "rc_deploy"
                    }
                ],
                "strict_required_status_checks_policy": true
            }
        }
    ]
}'
}
