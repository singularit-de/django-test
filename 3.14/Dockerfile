FROM ghcr.io/astral-sh/uv:0.12.1 AS uv

FROM python:3.14.6
COPY --from=uv /uv /uvx /bin/
