FROM ghcr.io/astral-sh/uv:0.5.30 AS uv

FROM python:3.13.2
COPY --from=uv /uv /uvx /bin/
