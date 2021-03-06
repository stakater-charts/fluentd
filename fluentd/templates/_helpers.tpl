{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "fluentd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fluentd.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "fluentd.labels.selector" -}}
app: {{ template "fluentd.name" . }}
group: {{ .Values.fluentd.labels.group }}
provider: {{ .Values.fluentd.labels.provider }}
{{- end -}}

{{- define "fluentd.labels.stakater" -}}
{{ template "fluentd.labels.selector" . }}
version: "{{ .Values.fluentd.labels.version }}"
{{- end -}}

{{- define "fluentd.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
