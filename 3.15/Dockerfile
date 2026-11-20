FROM ghcr.io/astral-sh/uv:0.13.9 AS uv

FROM python:3.15.2
COPY --from=uv /uv /uvx /bin/
