FROM ghcr.io/astral-sh/uv:0.13.8 AS uv

FROM python:3.15.0
COPY --from=uv /uv /uvx /bin/
