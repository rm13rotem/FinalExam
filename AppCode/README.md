# Application Code

Application source code (Flask app)
We are using 3 imports in the python : 
 os
 boto3
 flask

 I researched on them in the chat gpt and added the proper lines to 
 requirement.txt

 #docker build command : 
 docker build -t aws-flask-app .

 #Running the docker container (wouldn't normally do this into the git repository)
 docker run -e AWS_ACCESS_KEY_ID=AKIAXLEKZJVVREN3MIWD \
           -e AWS_SECRET_ACCESS_KEY=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 \
           -e REGION=us-east-1 \
           -p 5001:5001 aws-flask-app

# Access at my public ip :5001