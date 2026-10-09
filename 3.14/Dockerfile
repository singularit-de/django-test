FROM ghcr.io/astral-sh/uv:0.13.0 AS uv

FROM python:3.14.8
COPY --from=uv /uv /uvx /bin/
