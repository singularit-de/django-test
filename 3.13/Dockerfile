FROM ghcr.io/astral-sh/uv:0.12.7 AS uv

FROM python:3.13.15
COPY --from=uv /uv /uvx /bin/
