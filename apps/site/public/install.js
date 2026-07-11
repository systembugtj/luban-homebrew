#!/usr/bin/env node
/**
 * Install a formula from the luban-homebrew Homebrew tap.
 *
 * Usage:
 *   curl -fsSL https://systembugtj.github.io/luban-homebrew/install.js | node
 *   node public/install.js
 *
 * Env:
 *   LUBAN_FORMULA — formula name (default: gopdf)
 *   LUBAN_TAP     — tap id (default: systembugtj/luban-homebrew)
 *   LUBAN_HEAD    — set to 1 for --HEAD (default: 1 until stable bottles exist)
 */

const { execSync, spawnSync } = require("node:child_process");

const TAP = process.env.LUBAN_TAP ?? "systembugtj/luban-homebrew";
const FORMULA = process.env.LUBAN_FORMULA ?? "gopdf";
const HEAD_ENV = process.env.LUBAN_HEAD;
const USE_HEAD =
  HEAD_ENV === undefined
    ? true
    : HEAD_ENV === "1" || HEAD_ENV === "true";

function log(message) {
  process.stderr.write(`${message}\n`);
}

function fail(message, code = 1) {
  log(`[luban-homebrew] ERROR: ${message}`);
  process.exit(code);
}

function ensureBrew() {
  const result = spawnSync("brew", ["--version"], { encoding: "utf8" });
  if (result.status !== 0) {
    fail("Homebrew not found. Install from https://brew.sh");
  }
}

function installFormula() {
  const headFlag = USE_HEAD ? " --HEAD" : "";
  const spec = `${TAP}/${FORMULA}`;
  log(`[luban-homebrew] Installing ${spec}${USE_HEAD ? " (HEAD)" : ""}…`);
  execSync(`brew install${headFlag} ${spec}`, { stdio: "inherit" });
}

function verifyBinary() {
  if (FORMULA !== "gopdf") return;
  const result = spawnSync("gopdf", ["--help"], { encoding: "utf8" });
  if (result.status !== 0) {
    log("[luban-homebrew] WARN: gopdf installed but `gopdf --help` failed — check PATH");
    return;
  }
  log("[luban-homebrew] OK — run `gopdf --help`");
}

function main() {
  log("[luban-homebrew] Homebrew tap installer");
  ensureBrew();
  installFormula();
  verifyBinary();
}

main();
