# dagster-template
Template repo for a python application utilizing dagster


# Start Here to Develop

1. Prerequisites

- Install [Visual Studio Code](https://code.visualstudio.com/)
- Install [Visual Studo Code Extension - Dev containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- Install [Docker](https://www.docker.com/)

2. Confirm Docker is installed by executing command `docker -v`
3. Open VSCode to a New Window and open this repository's directory
4. You may see a notification that the Folder containers a Dev Container configuration file. If so, click on "Reopen in Container"

- If you do not see this notification, press `F1` key and begin typing the following until you can see the option "Dev Containers: Rebuild and reopen in Container".
- This action will reopen the VSCode within a Docker container suitable to develop and locally run the application.

5. The dev container will start up the Dagster application.

- To access the application, navigate to http://localhost:3000
  - The container forwards the port 3000 where the Dagster application is hosted
- Any changes made to the code will be reflected in the Dagster application when you reload the code deployment in the Dagster UI Deployment section.

6. Now inside the VSCode dev container, to run tests, execute `./tests/run_tests.sh`

- This script has an optional argument `-f` for "fix mode" which allows for configuration of black and ruff to automatically apply fixes.

7. As functions are added to the application, unit tests can/should be added in `tests/unit`, with existing support utilizing the `pytest` library.


# Adding python dependencies
[pip-tools](https://github.com/jazzband/pip-tools) is utilized to manage python dependencies.
- Using the `pyproject.toml` convention, one can add packages by adding to the lists of `dependencies` or `dev` optional dependencies.
- After modifying `./src/pyproject.toml`, execute `./regenerate_requirements.sh` to regenerate `./src/requirements.txt` and `./src/dev-requirements.txt`
- Finally, press `F1` key and begin typing the following until you can see the option "Dev Containers: Rebuild and reopen in Container".  Select this option to rebuild the dev container with your new dependencies included.

