FROM ghcr.io/astral-sh/uv:0.13.6 AS uv

FROM python:3.12.15
COPY --from=uv /uv /uvx /bin/
