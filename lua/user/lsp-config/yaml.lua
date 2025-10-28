-- YAML LSP customization
local M = {}

M.setup = function()
	local lspconfig = require("lspconfig")

	-- Configure YAML LSP
	lspconfig.yamlls.setup({
		settings = {
			yaml = {
				schemas = {
					-- GitHub Actions schema
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
					-- GitLab CI schema
					["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
						"/.gitlab-ci.{yaml,yml}",
						".gitlab-ci.{yaml,yml}",
					},
					-- Kubernetes schemas
					["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.8-standalone-strict/deployment.json"] = {
						"**/deployment.{yaml,yml}",
						"**/*deployment*.{yaml,yml}",
					},
					["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.8-standalone-strict/service.json"] = {
						"**/service.{yaml,yml}",
						"**/*service*.{yaml,yml}",
					},
					["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.8-standalone-strict/ingress.json"] = {
						"**/ingress.{yaml,yml}",
						"**/*ingress*.{yaml,yml}",
					},
					["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.8-standalone-strict/configmap.json"] = {
						"**/configmap.{yaml,yml}",
						"**/*configmap*.{yaml,yml}",
					},
					-- Kustomize schema
					["https://json.schemastore.org/kustomization.json"] = "**/kustomization.{yaml,yml}",
					-- Helm chart schema
					["https://json.schemastore.org/chart.json"] = "**/Chart.yaml",
					-- js/ts related schemas
					["https://json.schemastore.org/prettierrc.json"] = "**/.prettierrc.{yaml,yml}",
					["https://json.schemastore.org/eslintrc.json"] = "**/.eslintrc.{yaml,yml}",
					-- (temporary) Holochain schemas
					["https://raw.githubusercontent.com/andrewsomething/app-platform-json-schema/main/app_spec.json"] = {
						"**/spec.{yaml,yml}",
					},
					["https://raw.githubusercontent.com/holochain/holochain/refs/heads/develop/crates/hc_bundle/schema/dna-manifest.schema.json"] = "**/dna.{yaml,yml}",
					["https://raw.githubusercontent.com/holochain/holochain/refs/heads/develop/crates/hc_bundle/schema/happ-manifest.schema.json"] = "**/happ.{yaml,yml}",
					["https://raw.githubusercontent.com/holochain/holochain/refs/heads/develop/crates/hc_bundle/schema/web-happ-manifest.schema.json"] = "**web-happ.{yaml,yml}",
					["https://raw.githubusercontent.com/holochain/holochain/refs/heads/feat/generate-conductor-config-schema/crates/holochain_conductor_api/schemas/conductor_config.json"] = "**conductor-config.{yaml,yml}",
				},
				validate = false,
				completion = true,
				hover = true,
				format = {
					enable = true,
				},
				customTags = {
					"!reference sequence", -- For GitLab CI !reference tags
					"!include mapping", -- For GitLab CI includes
				},
				schemaStore = {
					enable = false, -- Disable schemaStore to prevent automatic schema detection
				},
			},
		},
		capabilities = require("lvim.lsp").common_capabilities(),
	})
end

return M
