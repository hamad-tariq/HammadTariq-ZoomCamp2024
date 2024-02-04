
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

✅ Docker installation and environment setup ([check here](https://youtu.be/EYNwNlOrpr0?list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb)

✅ [pgcli](https://pypi.org/project/pgcli/) installation

✅ [NY_taxi dataset](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

✅ [SQL Alchemy](https://pypi.org/project/SQLAlchemy/) for data manipulation

**Steps**

➡️ Running Postgres locally with Docker

```bash
docker run -it \
  -e POSTGRES_USER="root" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v c:/Users/alexe/git/data-engineering-zoomcamp/week_1_basics_n_setup/2_docker_sql/ny_taxi_postgres_data:/var/lib/postgresql/data \
  -p 5432:5432 \
  postgres:13
```

➡️ Using pgcli for connecting to the database

➡️ Exploring the NY Taxi dataset with pandas

➡️ Ingesting the data into the database with Python see [upload-data.ipynb](https://github.com/hamad-tariq/HammadTariq-ZoomCamp2024/blob/main/week_1_basics_n_setup/2_docker_sql/upload-data.ipynb)  

You can find the step by step guide to setting up a postgres and running it through pgcli [here](https://youtu.be/2JM-ziJt0WI?list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb). Find pgcli guidelines [here](pip install pgcli). You may need to download some other [dependencies](https://pypi.org/project/psycopg2/) along with pgcli to run the code properly. Make sure to star this repository to stay updated with the progress. 

# ZoomCamp-2024 DAY 3

The Goal is to connect the postgres server to the [pgadmin](https://www.pgadmin.org/) which is a GUI based tool used to manage and handle the postgreSQL database.


**Pre-requisits**

✅ The pgAdmin tool

✅ Docker networks

**Steps**

➡️ Run pgadmin on docker network
```bash
docker run -it \
    -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
    -e PGADMIN_DEFAULT_PASSWORD="root" \
    -p 8080:80 \
    --network=pg-networkfinal \
    --name pg-admin \
    dpage/pgadmin4
```

➡️ Run postgressql database on the same docker network as pgadmin

```bash
docker run -it \
    -e POSTGRES_USER="root" \
    -e POSTGRES_PASSWORD="root" \
    -e POSTGRES_DB="ny_taxi" \
    -v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql/data \
    -p 5432:5432 \
    --network=pg-networkfinal \
    --name pg-db1 \
    postgres:13
```

➡️ Login to pgadmin

➡️ After login to PgAdmin, right click Servers in the left sidebar.

➡️ Click on Register.

➡️ Click on Server.

➡️ Name the database

➡️ Go to connections and build a connection to the database *"pg-db1"*

➡️ Apply username and password to your postgres server and save the server


You can get step by step guidline on [how to connect your postgreSQL to pgadmin](https://www.youtube.com/watch?v=hCAIVe9N0ow&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb). Get pgadmin installation guides [here](https://www.pgadmin.org/)

# ZoomCamp-2024 DAY 4

The goal is to build a docker image and put the ingestion script into the docker container


**Pre-requisits**

✅ Docker networks

✅ Jupyter Notebook

**Steps**

➡️ Converting the Jupyter notebook to a Python script

```bash
jupyter nbconvert --to script ingest-data.ipynb
```

➡️ Parametrizing the [script](https://github.com/hamad-tariq/HammadTariq-ZoomCamp2024/blob/main/week_1_basics_n_setup/2_docker_sql/ingest-data.py) with argparse

➡️ Run locally
```bash
URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"

python ingest_data.py \
  --user=root \
  --password=root \
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --table_name=yellow_taxi_trips \
  --url=${URL}
```

➡️ Dockerizing the ingestion script

```bash
docker build -t taxi_ingest:v001 .
```

➡️ Run the script with Docker
```bash
URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"

docker run -it \
  --network=pg-network \
  taxi_ingest:v001 \
    --user=root \
    --password=root \
    --host=pg-database \
    --port=5432 \
    --db=ny_taxi \
    --table_name=yellow_taxi_trips \
    --url=${URL}
```

Course Video [here](https://www.youtube.com/watch?v=B1WwATwf-vY&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb&ab_channel=DataTalksClub%E2%AC%9B)

# ZoomCamp-2024 DAY 5

Run the postgresql and pgadmin both with a single docker image using docker compose


**Pre-requisits**

✅ Docker networks

✅ Docker compose

**Steps**

➡️ Build a docker compose image

```bash
docker-compose build
```

➡️ Run it

```bash
docker-compose up
```

➡️ Run it in detached mode (it will allow you to use the cli without interrupting the container)

```bash
docker-compose up -d
```

➡️ Shut down the container

```bash
docker-compose down
```

Guide: [Build and run your docker image](https://www.youtube.com/watch?v=hKI6PkPhpa0&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb)

### Get more help

To get more guidance on the zoomcamp follow on [Instagram](https://www.instagram.com/hamad_tariq001/) and drop a connection request on [LinkedIn](https://www.linkedin.com/in/hammad-tariq-269623207/)

###

## Authors

- [hamad-tariq](https://github.com/hamad-tariq)

