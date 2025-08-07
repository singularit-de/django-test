FROM ghcr.io/astral-sh/uv:0.8.6 AS uv

FROM python:3.9.23
COPY --from=uv /uv /uvx /bin/
