# typed: false
# frozen_string_literal: true

# Deprecated: use `kanban-md tui` instead (included in the kanban-md package).
class KanbanMdTui < Formula
  desc "DEPRECATED — use 'kanban-md tui' instead"
  homepage "https://github.com/antopolskiy/kanban-md"
  version "0.29.0"
  license "MIT"

  depends_on "antopolskiy/tap/kanban-md"

  def install
    # Nothing to install — kanban-md already provides the tui subcommand.
    (bin/"kanban-md-tui").write <<~SH
      #!/bin/sh
      exec kanban-md tui "$@"
    SH
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
