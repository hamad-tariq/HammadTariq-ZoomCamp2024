
# HammadTariq - Data Enginering - ZoomCamp2024

This repo is dedicated to the Data Engineering Zoom camp 2024 by Data Talks Club. The repo shows all the course activity, home works, workshop and projects. For more details about the course make sure to visit the readme file in the repository.

# ZoomCamp-2024 DAY 1

Day one has been an introduction to basics and environment setup for the activities throughout the ZoomCamp. Here are some of the key take aways for day 1:

▶️ Setting up github codespaces environment

▶️ Setting up customized docker environment for Python

▶️ Creating a simple data pipeline in Docker

You can find the step by step guide to setting up a docker container [here](https://youtu.be/EYNwNlOrpr0?list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb).


# ZoomCamp-2024 DAY 2

The goal is to ingest [dataset](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) into the postgresql database. 

Before ingesting the data, we will need to initialize docker container and then in the container we would need to have a postgres admin. We will use the pgcli library to interact with the postgresql database through the terminal. 

**Pre-requisits**

~ Docker installation and environment setup ([check here](https://youtu.be/EYNwNlOrpr0?list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb)

~ [pgcli](https://pypi.org/project/pgcli/) installation

~ [NY_taxi dataset](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

~ [SQL Alchemy](https://pypi.org/project/SQLAlchemy/) for data manipulation

**Steps**

~ Running Postgres locally with Docker

```bash
docker run -it \
  -e POSTGRES_USER="root" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v c:/Users/alexe/git/data-engineering-zoomcamp/week_1_basics_n_setup/2_docker_sql/ny_taxi_postgres_data:/var/lib/postgresql/data \
  -p 5432:5432 \
  postgres:13
```

~ Using pgcli for connecting to the database

~ Exploring the NY Taxi dataset with pandas

~ Ingesting the data into the database with Python see [upload-data.ipynb](https://github.com/hamad-tariq/HammadTariq-ZoomCamp2024/blob/main/week_1_basics_n_setup/2_docker_sql/upload-data.ipynb)  

You can find the step by step guide to setting up a postgres and running it through pgcli [here](https://youtu.be/2JM-ziJt0WI?list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb). Find pgcli guidelines [here](pip install pgcli). You may need to download some other [dependencies](https://pypi.org/project/psycopg2/) along with pgcli to run the code properly. Make sure to star this repository to stay updated with the progress. 

Follow on [Instagram](https://www.instagram.com/hamad_tariq001/) and drop a connection request on [LinkedIn](https://www.linkedin.com/in/hammad-tariq-269623207/)



## Authors

- [hamad-tariq](https://github.com/hamad-tariq)

