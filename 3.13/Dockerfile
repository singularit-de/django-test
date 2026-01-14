FROM ghcr.io/astral-sh/uv:0.9.25 AS uv

FROM python:3.13.11
COPY --from=uv /uv /uvx /bin/
