FROM gcr.io/kaniko-project/executor:v1.23.2-debug
COPY --chmod=777 ./build /kaniko/build
CMD [""] 
