FROM ghcr.io/astral-sh/uv:0.9.1 AS uv

FROM python:3.13.8
COPY --from=uv /uv /uvx /bin/
