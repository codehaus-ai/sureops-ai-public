{{/*
Expand the name of the chart.
*/}}
{{- define "sureops.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "sureops.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sureops.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sureops.labels" -}}
helm.sh/chart: {{ include "sureops.chart" . }}
{{ include "sureops.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sureops.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sureops.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
API selector labels
*/}}
{{- define "sureops.api.selectorLabels" -}}
{{ include "sureops.selectorLabels" . }}
app.kubernetes.io/component: api
{{- end }}

{{/*
Agent worker selector labels
*/}}
{{- define "sureops.agentWorker.selectorLabels" -}}
{{ include "sureops.selectorLabels" . }}
app.kubernetes.io/component: agent-worker
{{- end }}

{{/*
Frontend selector labels
*/}}
{{- define "sureops.frontend.selectorLabels" -}}
{{ include "sureops.selectorLabels" . }}
app.kubernetes.io/component: frontend
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sureops.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sureops.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Image reference helper — combines registry, repository, and tag
*/}}
{{- define "sureops.image" -}}
{{- $registry := .global.imageRegistry -}}
{{- printf "%s/%s:%s" $registry .image.repository .image.tag -}}
{{- end }}

{{/*
Database URL — constructs from postgresql config
*/}}
{{- define "sureops.databaseUrl" -}}
{{- if .Values.postgresql.enabled -}}
postgresql+asyncpg://sureops:$(DB_PASSWORD)@{{ include "sureops.fullname" . }}-postgres:5432/sureops
{{- else -}}
postgresql+asyncpg://{{ .Values.postgresql.external.username }}:$(DB_PASSWORD)@{{ .Values.postgresql.external.host }}:{{ .Values.postgresql.external.port }}/{{ .Values.postgresql.external.database }}
{{- end -}}
{{- end }}
