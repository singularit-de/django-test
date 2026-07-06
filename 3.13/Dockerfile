FROM ghcr.io/astral-sh/uv:0.11.27 AS uv

FROM python:3.13.14
COPY --from=uv /uv /uvx /bin/
