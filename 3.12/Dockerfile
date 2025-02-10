FROM ghcr.io/astral-sh/uv:0.5.29 AS uv

FROM python:3.12.9
COPY --from=uv /uv /uvx /bin/
