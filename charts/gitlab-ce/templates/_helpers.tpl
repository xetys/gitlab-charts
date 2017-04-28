{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified postgresql name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "postgresql.fullname" -}}
{{- printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified redis name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "redis.fullname" -}}
{{- printf "%s-%s" .Release.Name "redis" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the db hostname
If the postgresql dependency is enabled, it will return the postgresql fullname
Otherwise it will return the set value
*/}}
{{- define "dbHost" -}}
{{- if .Values.postgresql.enabled -}}
{{- template "postgresql.fullname" . -}}
{{- else -}}
{{- .Values.dbHost -}}
{{- end -}}
{{- end -}}

{{/*
Return the db database name
If the postgresql dependency is enabled, it will return the postgresql postgresDatabase
Otherwise it will return the set value
*/}}
{{- define "dbDatabase" -}}
{{- if .Values.postgresql.enabled -}}
{{- .Values.postgresql.postgresDatabase | quote -}}
{{- else -}}
{{- .Values.dbDatabase | quote -}}
{{- end -}}
{{- end -}}

{{/*
Return the db username 64bit encoded for secrets
If the postgresql dependency is enabled, it will return the postgresql user
Otherwise it will return the set value
*/}}
{{- define "encodeDbUsername" -}}
{{- if .Values.postgresql.enabled -}}
{{- .Values.postgresql.postgresUser | b64enc | quote -}}
{{- else -}}
{{- default "" .Values.dbUsername | b64enc | quote -}}
{{- end -}}
{{- end -}}

{{/*
Return the db password 64bit encoded for secrets
If the postgresql dependency is enabled, it will return the postgresql password
Otherwise it will return the set value
*/}}
{{- define "encodeDbPassword" -}}
{{- if .Values.postgresql.enabled -}}
{{- .Values.postgresql.postgresPassword | b64enc | quote -}}
{{- else -}}
{{- default "" .Values.dbPassword | b64enc | quote -}}
{{- end -}}
{{- end -}}

{{/*
Return the redis hostname
If the redis dependency is enabled, it will return the redis fullname
Otherwise it will return the set value
*/}}
{{- define "redisHost" -}}
{{- if .Values.redis.enabled -}}
{{- template "redis.fullname" . -}}
{{- else -}}
{{- .Values.redisHost -}}
{{- end -}}
{{- end -}}

{{/*
Return the redis password 64bit encoded for secrets
If the redis dependency is enabled, it will return redisPassword
Otherwise it will return the set value
*/}}
{{- define "encodeRedisPassword" -}}
{{- if .Values.redis.enabled -}}
{{- .Values.redis.redisPassword | b64enc | quote -}}
{{- else -}}
{{- default "" .Values.redisPassword | b64enc | quote -}}
{{- end -}}
{{- end -}}
