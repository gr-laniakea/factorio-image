FROM gcr.io/kaniko-project/executor:v1.23.2-debug
COPY ./build /kaniko/build
CMD [""] 
