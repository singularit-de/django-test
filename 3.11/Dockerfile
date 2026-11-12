FROM ghcr.io/astral-sh/uv:0.13.8 AS uv

FROM python:3.11.18
COPY --from=uv /uv /uvx /bin/
