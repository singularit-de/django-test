FROM ghcr.io/astral-sh/uv:0.13.6 AS uv

FROM python:3.14.9
COPY --from=uv /uv /uvx /bin/
