FROM ghcr.io/astral-sh/uv:0.12.0 AS uv

FROM python:3.14.3
COPY --from=uv /uv /uvx /bin/
