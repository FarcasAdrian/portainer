# portainer

Docker environments and helpers for running Portainer and example stacks.

This repository provides a ready-to-run Portainer compose file plus a few example Docker environments and Portainer templates you can import.

## Contents

- `portainer-compose.yaml` — Docker Compose file to start Portainer.
- `docker-environments/` — example stacks you can run locally (e.g. Laravel, Shopware).
- `portainer-templates/v3/templates.json` — App templates you can import into Portainer.

## Prerequisites

- Docker Engine installed (Linux recommended; Windows and macOS are supported).
- Docker Compose v2 (use the `docker compose` command) or the legacy `docker-compose` binary.
- Tested with Docker Engine 29.1.3 and Docker Compose 5.0.0 — this is the minimum tested version; other versions may work but are untested.

## Quickstart

Start Portainer using the included compose file:

```bash
docker compose -f portainer-compose.yaml up -d
```

After the stack starts, open the Portainer UI in your browser (Default URL: https://localhost:9443) and complete the initial setup.

## Stopping & Persistence

Stopping and removing
```bash
docker compose -f portainer-compose.yaml down
# remove volumes (DATA LOSS)
docker compose -f portainer-compose.yaml down -v
```

Persistence
- Portainer stores data in the volume defined in [portainer-compose.yaml](portainer-compose.yaml). Back up that volume before removing it.

## Troubleshooting

View logs:
```bash
docker compose -f portainer-compose.yaml logs -f
```

## Using the example environments

Each example environment is a self-contained Docker Compose stack. To run one, just use the Portainer UI or execute the following:

```bash
cd docker-environments/laravel-clean-install
docker compose up -d
```

Repeat for any other environment (for example `shopware-clean-install`). Review each environment's `docker-compose.yml` and Dockerfile for custom configuration and requirements.

## Importing Portainer templates

In the Portainer UI go to Settings → App Templates (or the Templates section for your Portainer version) and import the JSON file at `portainer-templates/v3/templates.json`.

## Development & Contributing

- Open issues for bugs or feature requests.
- Fork and submit a PR for changes or new example environments.
