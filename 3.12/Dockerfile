FROM ghcr.io/astral-sh/uv:0.13.8 AS uv

FROM python:3.12.16
COPY --from=uv /uv /uvx /bin/
