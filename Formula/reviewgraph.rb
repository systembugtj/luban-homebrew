# typed: false
# frozen_string_literal: true

class Reviewgraph < Formula
  include Language::Python::Virtualenv

  desc "Local-first code review knowledge graph and MCP server"
  homepage "https://github.com/borg0ai/dx-reviewgraph"
  url "https://github.com/borg0ai/dx-reviewgraph/releases/download/v2.3.11/reviewgraph-2.3.11-py3-none-any.whl",
      using: :nounzip
  sha256 "76326b63013f949762a963929562bcdbe1d4f8ac4f3fea496aa5a856cfc0d633"
  license "MIT"

  depends_on "python@3.13"

  resource "reviewgraph-engine" do
    url "https://github.com/borg0ai/dx-reviewgraph/releases/download/v2.3.11/reviewgraph_engine-2.3.11-py3-none-any.whl",
        using: :nounzip
    sha256 "35c62127ead08662ad78b4ca9c9bf4395efa71e1dfb38384c89a3f72ed8065bf"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")
    engine = resource("reviewgraph-engine")
    engine_wheel = buildpath/"reviewgraph_engine-2.3.11-py3-none-any.whl"
    cp engine.cached_download, engine_wheel
    venv.pip_install engine_wheel

    cli_wheel = buildpath/"reviewgraph-2.3.11-py3-none-any.whl"
    cp stable.cached_download, cli_wheel unless cli_wheel.exist?
    venv.pip_install_and_link cli_wheel
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reviewgraph --version")
  end
end
