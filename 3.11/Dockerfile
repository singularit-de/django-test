FROM ghcr.io/astral-sh/uv:0.6.14 AS uv

FROM python:3.11.12
COPY --from=uv /uv /uvx /bin/
