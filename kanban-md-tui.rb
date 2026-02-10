# typed: false
# frozen_string_literal: true

# Deprecated: use `brew install kanban-md` and `kanban-md tui` instead.
class KanbanMdTui < Formula
  desc "DEPRECATED — use 'kanban-md tui' instead"
  homepage "https://github.com/antopolskiy/kanban-md"
  url "https://github.com/antopolskiy/kanban-md/archive/refs/tags/v0.29.0.tar.gz"
  sha256 "6578501917494a634cb7164d674d28c052fd6efb7d841b15fc432ae71b0c5382"
  version "0.28.3"
  license "MIT"

  deprecate! date: "2026-02-10", because: "the TUI is now built into kanban-md; use 'kanban-md tui' instead"

  depends_on "antopolskiy/tap/kanban-md"

  def install
    (bin/"kanban-md-tui").write <<~SH
      #!/bin/sh
      echo "kanban-md-tui is deprecated. Use 'kanban-md tui' instead." >&2
      exec kanban-md tui "$@"
    SH
    chmod 0755, bin/"kanban-md-tui"
  end

  def caveats
    <<~EOS
      kanban-md-tui is deprecated and will be removed in a future release.
      The TUI is now built into the main binary. Use:

        kanban-md tui

      To switch, run:

        brew uninstall kanban-md-tui
        brew install kanban-md
    EOS
  end
end
