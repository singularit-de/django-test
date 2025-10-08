FROM ghcr.io/astral-sh/uv:0.9.0 AS uv

FROM python:3.13.8
COPY --from=uv /uv /uvx /bin/
