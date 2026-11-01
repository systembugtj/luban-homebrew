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
    cli_wheel = buildpath/"reviewgraph-2.3.11-py3-none-any.whl"
    cp stable.cached_download, cli_wheel unless cli_wheel.exist?

    # venv.pip_install passes --no-deps; the wheels need their PyPI dependencies
    # (networkx, mcp, fastmcp, tree-sitter, ...), so resolve them with plain pip.
    system formula_opt_bin("python@3.13")/"python3.13", "-m", "pip",
           "--python=#{venv.root}/bin/python", "install", engine_wheel, cli_wheel

    # watchfiles (only fastmcp's --reload helper, unused here) ships a prebuilt .so whose Mach-O
    # header has no room for Homebrew's dylib ID rewrite ("Failed to fix install linkage").
    rm_r Dir[venv.root/"lib/python3.13/site-packages/watchfiles*"]
    bin.install_symlink libexec/"bin/reviewgraph"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reviewgraph --version")

    # --version never imports graph_engine; a build does, so a missing dependency fails here.
    system "git", "init"
    (testpath/"a.py").write("def f():\n    return 1\n")
    system bin/"reviewgraph", "build"
  end
end
