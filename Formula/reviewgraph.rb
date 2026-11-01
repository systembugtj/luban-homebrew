# typed: false
# frozen_string_literal: true

class Reviewgraph < Formula
  include Language::Python::Virtualenv

  desc "Local-first code review knowledge graph and MCP server"
  homepage "https://github.com/borg0ai/dx-reviewgraph"
  url "https://github.com/borg0ai/dx-reviewgraph/releases/download/v2.3.10/reviewgraph-2.3.10-py3-none-any.whl",
      using: :nounzip
  sha256 "7380f3fb885f61c2f5cb43943f016b492fd0a5fcc57bab4d971f77cc5a1fcc02"
  license "MIT"

  depends_on "python@3.13"

  resource "reviewgraph-engine" do
    url "https://github.com/borg0ai/dx-reviewgraph/releases/download/v2.3.10/reviewgraph_engine-2.3.10-py3-none-any.whl",
        using: :nounzip
    sha256 "f306e3a13ba13aeaaae408f987cb18d96f85860a778cda02bdcb673d90e15f73"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")
    engine = resource("reviewgraph-engine")
    engine_wheel = buildpath/"reviewgraph_engine-2.3.10-py3-none-any.whl"
    cp engine.cached_download, engine_wheel
    venv.pip_install engine_wheel

    cli_wheel = buildpath/"reviewgraph-2.3.10-py3-none-any.whl"
    cp stable.cached_download, cli_wheel unless cli_wheel.exist?
    venv.pip_install_and_link cli_wheel
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reviewgraph --version")
  end
end
