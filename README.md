# dagster-template
Template repo for a python application utilizing dagster


# Local Docker development
- `run_pip_tools.sh`: Will build the Dockerfile up until the stage where pip-tools is installed and then regenerate `src/requirements.txt` and `src/dev-requirements.txt` based on any updates to depedancy specifications made in `src/pyproject.toml`
- `run_dev_container.sh`: Will build a dev Docker image and run a bash command within the container.
  - Port 3000 is forwarded, which is the default port used by `dagit`.
  - `./src` directory is mounted in Docker container allowing for local code changes to be reflected without restarting the container.
  - `./dagster_mount` directory is mounted as well for data storage. Included in `.gitignore` so that data is not checked in accidentally.

# Adding python dependancies
[pip-tools](https://github.com/jazzband/pip-tools) is utilized to manage python dependancies.
- Using the `pyproject.toml` convention, one can add packages by adding to the lists of `dependencies` or `dev` optional dependancies.
- After modifying `./src/pyproject.toml`, execute `./run_pip_tools.sh` to regenerate `./src/requirements.txt` and `./src/dev-requirements.txt`
- Finally, execute `./run_dev_container.sh` to build the container with the newly added dependancies.

# Example dagster_project
The example directory `./src/dagster_project` is provided as an example, utilizing the [hello_dagster.py](https://docs.dagster.io/getting-started/hello-dagster) provided by dagster
- Can test with `./run_dev_container.sh`, then
  - ```dagit -f dagster_project/hello_dagster.py -h 0.0.0.0```
  - Open your local browser to http://localhost:3000 to access
