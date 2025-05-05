# lla File Organizer Plugin

A plugin for `lla` that organizes files in directories using various strategies. It provides flexible, configurable organization methods with preview capabilities.

## Features

### Organization Strategies

- **Extension Strategy**

  - Groups files by their extensions
  - Optional nested categorization (e.g., `images/png`, `documents/pdf`)
  - Handles case-insensitive extensions

- **Date Strategy**

  - Organizes by file modification date
  - Configurable grouping (year, month, day)
  - Customizable date format patterns

- **Type Strategy**

  - Predefined categories (documents, images, videos, etc.)
  - Customizable category-to-extension mappings
  - Smart file type detection

- **Size Strategy**
  - Organizes files into size-based categories
  - Configurable size ranges
  - Default ranges: tiny (0-100KB), small (100KB-1MB), medium (1MB-100MB), large (100MB-1GB), huge (>1GB)

### Additional Features

- Preview mode to review changes before applying
- Configurable ignore patterns for files and directories
- Color-coded output for better visibility
- Detailed error reporting

## Configuration

The plugin uses a TOML configuration file located at `~/.config/lla/file_organizer/config.toml`:

```toml
[colors]
success = "bright_green"
info = "bright_blue"
error = "bright_red"
path = "bright_yellow"

[extension]
enabled = true
create_nested = true  # Create nested folders for similar types

[date]
enabled = true
format = "%Y/%m/%d"  # Folder structure format
group_by = "month"   # year, month, or day

[type_strategy]
enabled = true
categories = {
    "documents" = ["pdf", "doc", "docx", "txt", "md"],
    "images" = ["jpg", "jpeg", "png", "gif", "svg"],
    "videos" = ["mp4", "mov", "avi", "mkv"],
    "audio" = ["mp3", "wav", "flac", "m4a"],
    "archives" = ["zip", "rar", "7z", "tar", "gz"]
}

[size]
enabled = true
ranges = [
    { name = "tiny", max_bytes = 102400 },      # 0-100KB
    { name = "small", max_bytes = 1048576 },    # 100KB-1MB
    { name = "medium", max_bytes = 104857600 }, # 1MB-100MB
    { name = "large", max_bytes = 1073741824 }, # 100MB-1GB
    { name = "huge" }                           # >1GB
]

[ignore]
patterns = [".git", "node_modules", "target"]
extensions = [".tmp", ".bak"]
```

## Usage

### Basic Commands

```bash
# Organize using default strategy (extension)
lla plugin --name file_organizer --action organize --args /path/to/dir

# Organize using specific strategy
lla plugin --name file_organizer --action organize --args /path/to/dir extension
lla plugin --name file_organizer --action organize --args /path/to/dir date
lla plugin --name file_organizer --action organize --args /path/to/dir type
lla plugin --name file_organizer --action organize --args /path/to/dir size

# Preview changes before organizing
lla plugin --name file_organizer --action preview --args /path/to/dir extension

# Show help information
lla plugin --name file_organizer --action help
```

### Preview Format

The preview command shows a detailed, color-coded view of planned changes:

```
📦 File Organization Preview
══════════════════════════════════════════════════
Directory: /path/to/dir
Strategy: extension
══════════════════════════════════════════════════

📁 images/jpg
  → vacation1.jpg
  → family-photo.jpg
  → screenshot.jpg

📁 documents/pdf
  → report.pdf
  → invoice.pdf

📁 audio/mp3
  → favorite-song.mp3
  → podcast.mp3

══════════════════════════════════════════════════
Summary: 7 files will be organized into 3 directories
══════════════════════════════════════════════════
```

The preview shows:

- Current directory and selected strategy
- Files grouped by their target directories
- Clear arrows indicating file movements
- Summary of total files and directories
- Color-coded output for better readability

### Example Results

Each strategy organizes files differently:

```
# Extension Strategy (with nested = true)
/path/to/dir/
├── images/
│   ├── jpg/
│   │   └── photo.jpg
│   └── png/
│       └── screenshot.png
└── documents/
    ├── pdf/
    │   └── report.pdf
    └── txt/
        └── notes.txt

# Date Strategy (group_by = "month")
/path/to/dir/
├── 2024/
│   ├── 01/
│   │   └── report.pdf
│   └── 02/
│       └── photo.jpg
└── 2023/
    └── 12/
        └── notes.txt

# Type Strategy
/path/to/dir/
├── documents/
│   ├── report.pdf
│   └── notes.txt
├── images/
│   ├── photo.jpg
│   └── screenshot.png
└── audio/
    └── song.mp3

# Size Strategy
/path/to/dir/
├── tiny/
│   └── notes.txt
├── small/
│   └── photo.jpg
└── medium/
    └── report.pdf
```

## Development

The plugin is built with a modular architecture:

- Each strategy implements the `OrganizationStrategy` trait
- Configuration is handled through serde-compatible structs
- Error handling with detailed messages
- Color-coded output using the `colored` crate

### Adding New Strategies

1. Create a new strategy module in `src/strategies/`
2. Implement the `OrganizationStrategy` trait
3. Add configuration structs in `src/config.rs`
4. Register the strategy in `src/lib.rs`

## Building

```bash
cargo build --release
```

The compiled plugin will be available in `target/release/libfile_organizer.so` (Linux/macOS) or `target/release/file_organizer.dll` (Windows).
