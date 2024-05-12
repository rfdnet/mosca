rm */*.zip

zip -j insertDB/lambda.zip insertDB/index.js
zip -j get_from_db/lambda.zip lambda.zip get_from_db/index.js 
zip -j helloworld/lambda.zip helloworld/index.js