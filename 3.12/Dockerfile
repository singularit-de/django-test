FROM ghcr.io/astral-sh/uv:0.9.24 AS uv

FROM python:3.12.12
COPY --from=uv /uv /uvx /bin/
