FROM innovanon/ia_check_root AS check_root
#FROM ia_check_root AS check_root
COPY ./ ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt
RUN pip install --no-cache-dir --upgrade .
ENTRYPOINT ["python", "-m", "ia_elevate"]
