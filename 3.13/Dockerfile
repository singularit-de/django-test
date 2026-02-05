FROM ghcr.io/astral-sh/uv:0.9.29 AS uv

FROM python:3.13.12
COPY --from=uv /uv /uvx /bin/
