local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: 'v1', tag: 'v1' },
];

config.new(
  name='datadog-operator',
  specs=[
    {
      output: v.version,
      prefix: '^com\\.datadog\\..*',
      crds: ['https://raw.githubusercontent.com/DataDog/datadog-operator/main/config/crd/bases/%s/datadoghq.com_datadogagents.yaml' % v.tag,
	     'https://raw.githubusercontent.com/DataDog/datadog-operator/main/config/crd/bases/%s/datadoghq.com_datadogagentprofiles.yaml' % v.tag,
	     'https://raw.githubusercontent.com/DataDog/datadog-operator/main/config/crd/bases/%s/datadoghq.com_datadogmetrics.yaml' % v.tag,
	     'https://raw.githubusercontent.com/DataDog/datadog-operator/main/config/crd/bases/%s/datadoghq.com_datadogmonitors.yaml' % v.tag,
	     'https://raw.githubusercontent.com/DataDog/datadog-operator/main/config/crd/bases/%s/datadoghq.com_datadogslos.yaml' % v.tag],
      localName: 'datadog_operator',
    }
    for v in versions
  ]
)
