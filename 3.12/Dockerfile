FROM ghcr.io/astral-sh/uv:0.11.1 AS uv

FROM python:3.12.13
COPY --from=uv /uv /uvx /bin/
