# MongoDB replica set in docker
## How to use
+ Create keyfile: `openssl rand -base64 756 > ./mongo-keyfile` (if you use windows, please use wsl), then copy `mongo-keyfile` into source code.
- In `setup container`, use this environment variables:
    - `MONGO_USERNAME`: your mongodb username
    - `MONGO_PASSWORD`: your mongodb password
    - `PRIMARY_HOST`: your primary host. Example `kubernetes.docker.internal`
    - `PRIMARY_PORT`: default by `27017`
    - `SECONDARY_1_HOST`: Example `kubernetes.docker.internal`
    - `SECONDARY_1_PORT`: default by `27018`
    - `SECONDARY_2_HOST`: Example `kubernetes.docker.internal`
    - `SECONDARY_2_PORT`: default by `27019`

- Connect from mongo compass: use primary host and primary port