[![MseeP.ai Security Assessment Badge](https://mseep.net/pr/jiantaofu-appinsightmcp-badge.png)](https://mseep.ai/app/jiantaofu-appinsightmcp)

# App Market Intelligence MCP

[![smithery badge](https://smithery.ai/badge/@JiantaoFu/appinsightmcp)](https://smithery.ai/server/@JiantaoFu/appinsightmcp)

An MCP server that provides comprehensive market intelligence by analyzing data from both the Apple App Store and Google Play Store. Get insights about apps, market trends, competitors, and user feedback across the major mobile app marketplaces.

## API Coverage

### App Store API Coverage

| API Function | Implemented | MCP Tool Name | Description |
|-------------|-------------|---------------|-------------|
| app         | ✅ | app-store-details | Get detailed information about an App Store app |
| list        | ✅ | app-store-list | Retrieve apps from iTunes collections |
| search      | ✅ | app-store-search | Search for apps on the App Store |
| developer   | ✅ | app-store-developer | Get apps by a developer |
| privacy     | ✅ | app-store-privacy | Get privacy details for an app |
| suggest     | ✅ | app-store-suggest | Get search suggestions |
| similar     | ✅ | app-store-similar | Get similar apps |
| reviews     | ✅ | app-store-reviews | Get app reviews |
| ratings     | ✅ | app-store-ratings | Get app ratings |
| versionHistory | ✅ | app-store-version-history | Get app version history |

### Google Play API Coverage

| API Function | Implemented | MCP Tool Name | Description |
|-------------|-------------|---------------|-------------|
| app         | ✅ | google-play-details | Get detailed app information |
| list        | ✅ | google-play-list | Retrieve apps from collections |
| search      | ✅ | google-play-search | Search for apps |
| developer   | ✅ | google-play-developer | Get apps by developer |
| suggest     | ✅ | google-play-suggest | Get search suggestions |
| reviews     | ✅ | google-play-reviews | Get app reviews |
| similar     | ✅ | google-play-similar | Get similar apps |
| permissions | ✅ | google-play-permissions | Get app permissions |
| datasafety  | ✅ | google-play-datasafety | Get data safety information |
| categories  | ✅ | google-play-categories | Get list of categories |

## Usage

Start the MCP server:

```bash
node src/server.js
```

The server exposes tools that can be used through any MCP client. For example, using Claude for Desktop, you can:

- Search for apps across both stores
- Get detailed app information
- Read reviews and ratings
- Find similar apps
- Check app privacy and permissions
- And more

## Usage Examples

```javascript
// Get top free iOS apps
{
  "name": "app-store-list",
  "params": {
    "collection": "topfreeapplications",
    "num": 10
  }
}

// Get top paid Android games
{
  "name": "google-play-list",
  "params": {
    "collection": "TOP_PAID",
    "category": "GAME",
    "num": 10
  }
}
```

## Test with MCP Inspector

```
npm run test:inspector
```

![MCP Inspector](inspector.png)

## Test with mcp-cli

```
npx @wong2/mcp-cli npx -y "app-insight-mcp"
```

## Usage with Claude Desktop
Add this to your `claude_desktop_config.json`:

### Installing via Smithery

To install App Market Intelligence for Claude Desktop automatically via [Smithery](https://smithery.ai/server/@JiantaoFu/appinsightmcp):

```bash
npx -y @smithery/cli install @JiantaoFu/appinsightmcp --client claude
```

### Docker

```json
{
  "mcpServers": {
    "app-insight-mcp": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "app-insight-mcp"
      ]
    }
  }
}
```

### NPX

```json
{
  "mcpServers": {
    "app-insight-mcp": {
      "command": "npx",
      "args": [
        "-y",
        "@jeromyfu/app-insight-mcp"
      ]
    }
  }
}
```

## Build

Docker build:

```bash
docker build -t app-insight-mcp -f Dockerfile .
```

## Error Handling

All tools include error handling and will return appropriate error messages if:
- Required parameters are missing
- API calls fail
- Rate limits are hit
- Invalid IDs or parameters are provided

## Contributing

Feel free to contribute by:
1. Implementing missing features
2. Improving error handling
3. Adding more API capabilities
4. Enhancing documentation

## License

MIT
