FROM ghcr.io/astral-sh/uv:0.7.11 AS uv

FROM python:3.13.4
COPY --from=uv /uv /uvx /bin/
