eb init udagrame-api --region us-east-1 --platform node.js && eb use Udagrameapi-env && \
eb setenv AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION POSTGRES_USERNAME=$POSTGRES_USERNAME POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
POSTGRES_HOST=$POSTGRES_HOST POSTGRES_DB=$POSTGRES_DB JWT_SECRET=$JWT_SECRET \
DB_PORT=$DB_PORT AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY AWS_PROFILE=$AWS_PROFILE URL=$URL AWS_BUCKET=$AWS_BUCKET \
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID AWS_REGION=$AWS_REGION && eb deploy
