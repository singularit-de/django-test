FROM ghcr.io/astral-sh/uv:0.8.11 AS uv

FROM python:3.13.6
COPY --from=uv /uv /uvx /bin/
