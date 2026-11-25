FROM ghcr.io/astral-sh/uv:0.13.10 AS uv

FROM python:3.13.18
COPY --from=uv /uv /uvx /bin/
