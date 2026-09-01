FROM ghcr.io/astral-sh/uv:0.12.8 AS uv

FROM python:3.11.16
COPY --from=uv /uv /uvx /bin/
