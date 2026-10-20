FROM ghcr.io/astral-sh/uv:0.13.3 AS uv

FROM python:3.13.16
COPY --from=uv /uv /uvx /bin/
