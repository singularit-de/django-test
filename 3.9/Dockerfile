FROM ghcr.io/astral-sh/uv:0.9.8 AS uv

FROM python:3.9.25
COPY --from=uv /uv /uvx /bin/
