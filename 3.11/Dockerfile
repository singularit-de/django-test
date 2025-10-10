FROM ghcr.io/astral-sh/uv:0.8.24 AS uv

FROM python:3.11.14
COPY --from=uv /uv /uvx /bin/
