FROM ghcr.io/astral-sh/uv:0.10.7 AS uv

FROM python:3.10.20
COPY --from=uv /uv /uvx /bin/
