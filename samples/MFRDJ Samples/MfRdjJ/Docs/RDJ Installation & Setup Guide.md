> FPC/Lazarus edition for Windows x64. Read the [build, package and dependency guide](../../FPC-LAZARUS.md) before using these operational instructions. This copy uses SQLDB/SQLite, LCL controls and the FPC HEOS dependency. The Delphi original is maintained separately.

# RDJ Installation & Setup Guide

> RDJ Pro can use FxServe or Caddy. FxServe is the
> smaller RDJ choice; Caddy is does larger or more complex
> web setups. See [RDJ Web Server Setup](../../SERVER-SETUP.md)
> for the current paths and short installation steps. The Caddy examples below
> remain available for Caddy users.

---

# Overview

RDJ supports two setup modes:

## Local Setup (Single PC)

All components run on one machine:

* RDJ
* FxServe/Caddy

**Use this for:**

* Testing
* Development
* Private use on your local network.

---

## Server Setup (Network / Internet)

FxServe/Caddy runs on a **server PC**, accessible by:

* Local network (LAN)
* Internet (public users)

Use this for:

* Radio stations
* Public streaming
* Multi-device access

---

# Network Basics (IMPORTANT)

| Situation     | Host                |
| ------------- | ------------------- |
| Same PC       | `127.0.0.1`         |
| Local Network | `192.168.x.x`       |
| Internet      | Domain or Public IP |

---

## Explanation

### 127.0.0.1

* Refers to **your own PC**
* Only works locally

---

### 192.168.x.x

* Local network address
* Works on devices in same network

---

### Domain / Public IP

* Required for internet streaming
* Example:

```text
factoryxradio.asuscomm.com
```

---

# Caddy Setup (Web + PWA)

1. Extract:

```text
..\MfPack\Samples\MfRdjJ\Binaries\Caddy_PWA.zip
```

2. Copy to (for example):

```text
C:\Caddy
```

---

# Windows Firewall (SERVER PC)

## Must allow:

### Applications:

* `caddy.exe`

### Ports:

| Port | Purpose |
| ---- | ------- |
| 8000 | Stream  |
| 80   | HTTP    |
| 443  | HTTPS   |

**Enable for:**

* Private
* Public

---

# Router Setup (Internet Streaming)

Enable **Port Forwarding**:

| External | Internal | IP        |
| -------- | -------- | --------- |
| 80       | 80       | Server IP |
| 443      | 443      | Server IP |

---

# DDNS (Recommended for testing or non commercial use)

Example (Router supporting DDNS like some ASUS models):

```text
yourradiostationname.asuscomm.com
```

Enable:

* DDNS
* Let's Encrypt SSL

---

#  Server PC vs User Device

##  Server PC

Runs:

* FxServe/Caddy

Must have:

* Firewall configured
* Ports open
* Correct IP/domain

---

## User Device *(like smartphone or pc)*

Only:

* Opens webpage / PWA (Progressive Web App)
* Plays stream

Note: No firewall setup needed

---

# RDJ Project Setup for FPC/Lazarus

Follow the [FPC build guide](../../FPC-LAZARUS.md). Open MfRdjJ.lpi, use the runtime/design .lpk packages and copy the x64 sqlite3.dll beside the executable. FireDAC is replaced by SQLDB/SQLite; no FireDAC installer is required.

The library is created in Data/RDJLibrary.db beneath the executable folder. Direct Lazarus project builds use bin/x86_64-win64; the build script uses build/rdj-<toolchain>/<group>.

## Database care

RDJ Pro uses SQLite WAL mode, so `RDJLibrary.db-wal` and `RDJLibrary.db-shm` may
appear while it is running. This is normal.

* Close RDJ Pro before backing up or replacing the database.
* Back up the complete `Data` folder, not only a file that is open in RDJ Pro.
* Do not let two RDJ Pro instances write to the same database.
* Keep the live database on a reliable local disk. Do not run it directly from
  an intermittent network share.

---

#  Running RdjPro

First run:

* Creates INI
* Opens Setup dialog

---

# General Settings

* Select Master Output
* Enable Headphones (Cue)
* Set buffer: **60 ms**

---

# Microphone

* Enable input
* Select device

---

# Audio Recorder

* Buffer: 60 ms
* Latency: 100 ms

---

# Broadcast Setup

## Local

```text
Host: 127.0.0.1
```

---

## LAN (Server)

```text
Host: 192.168.x.x
```

---

## Internet

```text
Host: yourdomainname.com
```

---

## Common Settings

```text
Port: 8000
Mount: /live
User: source
Password: your_password
```

---

# Caddy Setup

```text
The path where you installed Caddy, like:
C:\Caddy
C:\Caddy\Caddyfile
C:\Caddy\nowplaying.json
```

Run:

```text
 caddy.exe run --config "C:\Caddy\Caddy.cff" --adapter caddyfile
```

---

# Accessing the Stream

## Same PC

```text
http://127.0.0.1:8000/live
```

---

## LAN

```text
http://192.168.x.x:8000/live
```

---

## Internet

```text
https://yourdomain.com
```

---

# Troubleshooting

## Works on PC, not phone

**Check:**

* Firewall
* Router ports

---

## HTTPS not working

**Check:**

* Port 443
* Caddy running
* DDNS

---

## Stream reconnects / unstable

**Possible reasons:**

* Buffer too small
* Network issues

---

# Final Checklist

## Server PC

* [ ] Caddy running
* [ ] Firewall allow Caddy and RdjPro
* [ ] Ports forwarded
* [ ] Correct host

---

## User Device

* [ ] Correct URL
* [ ] Network access

---

# Summary

| Setup    | Host        |
| -------- | ----------- |
| Local    | 127.0.0.1   |
| LAN      | 192.168.x.x |
| Internet | Domain      |

---

- The server does all the work
- A user only connects

Copyright FactoryX. Original source and documentation license notices apply.
