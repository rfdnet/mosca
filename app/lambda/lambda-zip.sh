rm */*.zip

zip insertDB/lambda.zip insertDB/index.js ; zip get_from_db/lambda.zip lambda.zip get_from_db/index.js ; zip helloworld/lambda.zip helloworld/index.js