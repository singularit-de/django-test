FROM ghcr.io/astral-sh/uv:0.8.9 AS uv

FROM python:3.12.11
COPY --from=uv /uv /uvx /bin/
