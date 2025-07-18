FROM ghcr.io/astral-sh/uv:0.7.22 AS uv

FROM python:3.11.13
COPY --from=uv /uv /uvx /bin/
