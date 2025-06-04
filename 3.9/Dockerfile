FROM ghcr.io/astral-sh/uv:0.7.11 AS uv

FROM python:3.9.22
COPY --from=uv /uv /uvx /bin/
