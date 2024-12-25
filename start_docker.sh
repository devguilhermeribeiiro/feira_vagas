docker build -t feiravagas .
docker run -d -p 3000:3000 --env-file .env feiravagas
