
@ECHO OFF
SETLOCAL
	:: SET "MINIO_ACCESS_KEY="
	:: SET "MINIO_SECRET_KEY="
	:: Make sure the --address port and Endpoint port in ServiceManifest.xml are the same
	:: MINIO_MODE 1=Server 2=gateway nas 3=gateway azure
	IF %MINIO_MODE% EQU 1 (
		CALL minio.exe server %MINIO_STORAGE% --config-dir C:\Minio\ --certs-dir C:\Minio\certs
	) 
	IF %MINIO_MODE% EQU 2 (
		CALL minio.exe gateway nas %MINIO_STORAGE% --config-dir C:\Minio\ --certs-dir C:\Minio\certs
	)
	IF %MINIO_MODE% EQU 3 (
		CALL minio.exe gateway azure --config-dir C:\Minio\ --certs-dir C:\Minio\certs
	)
ENDLOCAL