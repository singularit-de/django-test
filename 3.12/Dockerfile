FROM ghcr.io/astral-sh/uv:0.7.7 AS uv

FROM python:3.12.10
COPY --from=uv /uv /uvx /bin/
